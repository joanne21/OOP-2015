function [x_out, y_out, z_out] = cordic_pe2_lat(x, y, z, ii, epsilon, ...
                                                nbits, binpt, lat)

  round_proto = {xlSigned, nbits, binpt, xlRound, xlWrap};
  epsilon = xfix(round_proto, epsilon);

  proto = {xlSigned, nbits, binpt};

  x = xfix(round_proto, x);
  y = xfix(round_proto, y);

  rsh_x = xfix(proto, xl_rsh(x, ii));
  rsh_y = xfix(proto, xl_rsh(y, ii));

  if xl_slice(y, nbits-1, nbits-1)==0
    x_internal = x + rsh_y;
    y_internal = y - rsh_x;
    z_internal = z + epsilon;
  else
    x_internal = x - rsh_y;
    y_internal = y + rsh_x;
    z_internal = z - epsilon;
  end

  x_internal = xfix(proto, x_internal);
  y_internal = xfix(proto, y_internal);
  z_internal = xfix(proto, z_internal);




  persistent xp;
  persistent yp;
  persistent zp;

  if lat > 0
    xp = xl_state(zeros(1, lat), proto, lat);
    yp = xl_state(zeros(1, lat), proto, lat);
    zp = xl_state(zeros(1, lat), proto, lat);

    x_out = xp.back;
    xp.push_front_pop_back(x_internal);

    y_out = yp.back;
    yp.push_front_pop_back(y_internal);

    z_out = zp.back;
    zp.push_front_pop_back(z_internal);
  else
    x_out = x_internal;
    y_out = y_internal;
    z_out = z_internal;
  end
