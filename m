Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518F3161BD
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506696; cv=none; b=ED6bR85tUqLaeeDsiT8dtZXHKFVZTWY1NCzwgI8GiDESjyMWg+gVWi3b5gfW3r2TeoPvWp//SzQu9Ptau/YKf9WMrnpQnoXQ/GcivsDe/itygwFHNk3kXYSkmRgY+9HyiQdtHr5OxB4KUyMDWIo8/EH9cMJR209rwhZp8jte40A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506696; c=relaxed/simple;
	bh=Xm0T+ra2WFrzdRdP3JxtuaEukspvdWnhUZFpw+N+Mdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNFTF1GxrSaH/WN+raTtJ9XqnfisOCkfUpq6tbyGC3tzDr6VryXi2epKe+Q4P31EbwAuYMtNErm0T4lCuyUtxyRTmpyDdXV2fOuXq0jNwUnjicO5/dcRz5FhtSqLyHD0WlCfyVm+82q1KPzCAz1eY8ZhO9hIZl6XJDIJ7s3Zg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqCEyeX4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqCEyeX4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7af73974a4bso339223b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 01:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762506694; x=1763111494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW8/cbGR87ObHsZ6SNcI+MXLmQ5paXElRz+RxrOT/SU=;
        b=AqCEyeX4UpT/bc6Wv6wOYRUfMdrWzlrG37mKRQm5L+SZE5zXqeWEmLWJbONXLzH2Cg
         qITjBji6ht78nTiCeatG/+BIZk/57dvHjxAIXIZDyTY/qablhIovDOrz6YEZYlARzIiC
         fuwbx0Qhi7mbAUESRgFe2RuzDEX3ez4fpe/CBgmSW2JuDPM9JR5qBudqo5Zzg9sRtI3x
         YCCjytUhqy3vlHoPDFTIbemvf2WIrGUjAq/Nksq8TItZPG5yodh9cinbF1JQIhXqai6W
         hA/+pw2GI9Tv9LVSV6lQv38+4nz3C2YI5+ILpQazNCxTaVr9fFdoxnqsSHThnxBmEcvK
         MSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506694; x=1763111494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hW8/cbGR87ObHsZ6SNcI+MXLmQ5paXElRz+RxrOT/SU=;
        b=MYT98jvDxyE/n4t2E7MFEqoEfJLIzLjc0c2yRWSCnnwtrBapPWWbdTHnKwma3pDmZ4
         ntGdeZ1NIbGhhXu+COvCe4i0Fs8M1SUoxwOkmeIVZ8idWT6dxPKqz0aLqCDNLkbSYPP1
         6JZ9aHRSpSfWdbpVm5n3NMTjAi1HSyqDJXk8qox4ZRV3k0u2FWjPAkzxWCZI4KHCJC3D
         7m2KvAFSOcS7oFKr8kWcBIEavhwCxOQuIw62hn3TZE+w96oFgRF0YDeLiuved2UVWoeY
         LCyNxN+ww5a9yyY9TOqnoRtYUz4t9JafieUoNyPPNRQRuxjYk1MaL9IvJs9ce6tr8if0
         kkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLBF2Rm6Nkv7Q/2UIRU5RXptYJWFWb8RIGXhWWXttylGCcRED1Vzssn8N346LPHNBD9mEmt0dKyvFzt2FWSBY1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc9PIWh5knQNd1bbBaM+QxteZs6b3sTFHRRfUCC/WQLgnG0/wY
	/yjBlmmGScq1JYDbx8vsqI6TcrWvNf1X6BSGgkGg8tfhfiDj5aOSXZxgBPcFUFusoXWhkyQk07M
	6lsphwnbe1Yg5yuCoTAyYctrwmxR6PlE=
X-Gm-Gg: ASbGncuvwpx3fz0o2WusqLYEdQvJ/jU3M/GchONek00n288m2YwbCTEGGze94LuFCj2
	ioxwvJF1pz5vwFs0K6AR4L9LJEpzsG+mdWlcF598uoi9pwru6yvFtQqFuurlODvgtvKzj3ZOAEx
	SI4Z6JFstwGkDUeR0zkNjdcFql/nqgFVRckg6SjwF9hpzBsdkZzV2JKHc4szyBqEEa+DS9F/JVz
	9+kFRhsQPVrsuRQDRGS9YKZZ2XXpQ5eSil2sk3jCKfdcqdm0AI8/cHRFQ==
X-Google-Smtp-Source: AGHT+IFsw4Qh5yQvF8GQ7bDn+i+78HlvDDo9Xlss7dAXe32EJJ3DKG/FTpv0vFs5HihRB4beIyG1MovPvmR4t9DxwLk=
X-Received: by 2002:a17:902:f705:b0:295:57f6:759 with SMTP id
 d9443c01a7336-297c95acc53mr15301995ad.15.1762506694201; Fri, 07 Nov 2025
 01:11:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 11:13:59 +0200
X-Gm-Features: AWmQ_bkGy3n9ih8PCPlxo3uy5k4L6qRRgXRYWv7PUkhd8VPxIzhklJdDlhNWAZ4
Message-ID: <CAEnQRZDcrWdAFqJkcbjy-jL=EczgmSM9grv5zp6bntWnqou_kQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] remoteproc: imx_rproc: Add support for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 4:27=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

With the minor comment below, you can add my:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

<snip>

> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 =3D {
> +       .att            =3D imx_rproc_att_imx95_m7,
> +       .att_size       =3D ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +       .ops            =3D &imx_rproc_ops_sm,
> +       /* Must align with System Manager Firmware */

I would add a comment here like this:

> +       .cpuid          =3D 1, /* Use 1 as default cpu id for M7 core */
> +       .lmid           =3D 1, /* Use 1 as default Logical Machine where =
M7 resides */
> +};
> +
