Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4642B22B8C8;
	Tue, 11 Mar 2025 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683492; cv=none; b=Uf5ep1lTUr+zlxlxiW36iiLCeR93VnYSzbMqnOyNvZuNXDjuv6j62XgCqHu7r+e/fnO+OTu3v5PkOYOCDrmzrA98IIyI+eZUhI4DeF4ScmatumC1LvLLwz5kursQSBfkt6u8+mmtAI3zhmLdCrixt4vZ52g17ABHE0RAprisbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683492; c=relaxed/simple;
	bh=OoJriUqFnHkd+c0rjQnFxlTZBZ6vjf/CcBs/t4RG/qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SORXNt9yy1fAM7Y1D47ipPLTCy6gzoPhCVhbs07ml3NgAsR7h5rqxqPLeQ/OLMRdUH6qean2KPCOvOLlpYIA0QzNAORxlFmMjJhrMWFD56j6l0FxXCDVM4hyDU/awSr+nYiWxDIkPfy4UXrighCMwoNFIUqUqfF+oo+98Xk/AcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhKWg8H/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhKWg8H/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223378e2b0dso74725505ad.0;
        Tue, 11 Mar 2025 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741683490; x=1742288290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA2bydqpRt+OlncV1V8Whn8hMq0Jg5Zcz7zDV610P04=;
        b=EhKWg8H/EED1d/oByTVJ84RBaig5RAY1EZQP4utb8PYsNCL3y6RxEq689Pct+WZ3Xb
         f5onIEyWWRUXXDpoGg9zTdFXKi3X7HuBPmKV53tsLe5q3T49d8SGXXfYVwwsAjjB2/Tf
         li48FYU8GGhFPHwV1kRKikEmfzqQ1XOMcBOEKKEsdAXgd3xwRdIZOwtnZqaAkkIpeVZV
         IxIz7jnKLn64ffvFSwR+B/q3771/KWm/e8LKBBgwqkcvi0DaaQmydx+9iJJGgji5YyZa
         QBwGgP/dYjKGsePWt6OjgcD29Pkzyq9dj8+hgb1P8KhJ3d/M2zy4X2oi5+F2lyoDAfHH
         jNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741683490; x=1742288290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lA2bydqpRt+OlncV1V8Whn8hMq0Jg5Zcz7zDV610P04=;
        b=Ii+rBTAvqwSvYJFAaO11cd6LTy64usPM7n0o80izwxS9O/GuLf+T/+b7qX3zQHPsI/
         dwCHx4K+EULYcYfAmNE2mzz6Q29vJ/iH/yT8MHskz3vvrlMAHcyKPTmDVSiFPUzATwdg
         tRJkmqio6sm5p4UC51Cv8svSukcRZAQ6At53xGGHvBikTOSLOlTojE7uWzTgV6LW+iPX
         19kO4b/gyxkRnDc2ksISLamC25EQfMVhg/twTLeZsEZNUBpQuKrSkYHmQR3k22UdHuHD
         oehTe16D4/u1RRdUo4tcVga3Zlu52Qtfo5Ql3CDhstn6mEG7OzbwALQ3j42SQm+YRqyb
         I1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUme9L7ZKoiJjh8DVnJ0ZBFJ6skAXgDCWY05tacaLGHOpOd33l4NSvZgqJbL9U1XOgUYKemgfAEd1JO@vger.kernel.org, AJvYcCUq3TOfbL4lZXfHr1drregjYzZZ3qwgZP5eNZai2PXQSDN6MZnXwO9DIud8dM2SYTBHc0HSN92127MbWrp5knDO5Q==@vger.kernel.org, AJvYcCXKt5KE7q11PMH/nBvKvbj3JaPuigIyozO31VkcJ+/I3J9qpeOx3MoGH+FElJXxkAlAeGQyjdczKq1kh8CW@vger.kernel.org
X-Gm-Message-State: AOJu0YzVELYUMiLVhk6uMoH9b7OlTaQsy/tm63nLkyCUMnp5wxkNzW8Y
	TDb2U9Z8VMLp2H197XA+Cfi04MuvC7yHeq2OGOSM+I8jlgRGl5eJPsHcc7mdBgngt95ntcj6D1B
	lq+Von92G2NrnWomhB/+4PDFtBlA=
X-Gm-Gg: ASbGncsy5RxcRU/FVPQr4utshcF6bqMt94sIwgjERCEm0cK4KK4xQHKiLcelsPT/d9g
	bFm2g/zcQa0BD5sMdTLEcRAsXhAWg/SI9EH6S4joLvn67m6kKk1VxFRNq9gdjVEIBD8TWsdgWc4
	7kcVg9SvsDwZ4dfpYjnVuwGrg=
X-Google-Smtp-Source: AGHT+IHRbLEfFkSRN7svD/SU2NARgmIEUPnyFQQfIvjDTjaMuTGcz4qJxDZa2+cv/4IHsddy318d5FT1qriGzMT0Ex0=
X-Received: by 2002:a17:902:ec84:b0:220:ca08:8986 with SMTP id
 d9443c01a7336-22428a98135mr255205425ad.22.1741683490491; Tue, 11 Mar 2025
 01:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-9-daniel.baluta@nxp.com> <Z88Ib7HkbRQoiyZp@p14s>
In-Reply-To: <Z88Ib7HkbRQoiyZp@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Mar 2025 10:59:46 +0200
X-Gm-Features: AQ5f1Jqksp8_Ow3W7CPPxQeuga9K9-0CI_LlAxXmLAD4nYxorLD8ECBrBf3t_78
Message-ID: <CAEnQRZDeBkNYBNQwJL5LZgLK49siqomzyM_RDccdusJa22yiJA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 5:43=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Mar 05, 2025 at 12:00:36PM +0200, Daniel Baluta wrote:
> > DSP on i.MX8MP doesn't have a direct reset line so according to hardwar=
e
> > design team in order to handle assert/deassert/reset functionality we
> > need to use a combination of control bits from two modules. Audio block
> > control module for Run/Stall control of the DSP and DAP module in order
> > to do software reset.
> >
> > Initial design accessed RunStall bits from audio block control using th=
e
> > syscon interface but this got NACKed by community because of abusing th=
e
> > syscon interface [1].
> >
> > So instead we use the reset controller API.
>
> I am good with this patchset.  The only thing I'd like so see modified is=
 the
> above changelog.  The second paragraph doesn't belong there, i.e it is no=
t
> useful to remark on a design that was not accepted.  Instead please conce=
ntrate
> on _why_ we are moving from the current design to using the reset control=
ler
> API.
>
> This can go in the 6.15 merge window if you send me a V5 fast enough.

Thanks for review. Reworded the commit message and send V5.

Thanks,
Daniel.
