Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520943A1DB;
	Tue, 25 Feb 2025 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490414; cv=none; b=GFJ6ipogC3rim5ohfPJCFlp3LUb6/bL8dLU4DnWdBND/GH0dKD/frrb0b5D88vgCFPPrLc0EgRmSsaywyZ9k2bNjv/j9+8HSyg51B1+qLYDtYj9posEo2LaYbIqAm7zALAGR1cWlL2t7sG2NEoW6YRxYw5HmqMc9sfGcQVgudhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490414; c=relaxed/simple;
	bh=53fpyJmRj6Rqqv2hcXrWuNnqYKt92WXS893aUdbh8v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCLBzlc/VynZ1D5qoLODgQ9w7KlQenzZ3GCtkOpkEcWX7RN5hsJ/2KaOua969FPCsSy+AEik1hCvkEZlOr5wCXtKpvnYQ509THP4o5VDb3jQ3/vAvCqWRrGa/1BTTk0QddoVE+oyPfc9tOJGpNHusAUDufK7an1cOrHm8d02Du0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCXVaAsm; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCXVaAsm"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso9036613a91.1;
        Tue, 25 Feb 2025 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490412; x=1741095212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyOopy8tN2qVORYzVG5T+W7YiTWMkF64OU8YybIupHw=;
        b=VCXVaAsmFGVzcQfhS5SdnMYy/8K48x7L5EiytKOm3Sy2ZKd8HDE0vxdOajE4deyzYp
         n6c40w2DbJOj9ZNRQK7uhUy6T9ZbVTNcYNpt5bIwSIft1t9MLBPJ+AIhAFMIgqRStphh
         7XRQ5PZ4UwC4inkoc7X2puU2OeOzvB3tfgePklGgVRTeOselrEYvcmTinEuquZaq/IN+
         SwL1rrIbcaIckonB8rjttWDyUi8uYrtsDDS1w/zDRzo2Bu3Gi1UhwHGnbK5Q9yIoQblq
         lI5oVb9bktwH4B1A5y2zgkndojvblC+UmkvOY78mbXnvCZtnVbrzPEeoS4kUNNfmbvAR
         K9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490412; x=1741095212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyOopy8tN2qVORYzVG5T+W7YiTWMkF64OU8YybIupHw=;
        b=WNGV0l/hZsTm23Nsw4oe0wnWePUWIUUtJWGq1SHUeUEY5ZW3LAFRhjlhPoTQBHIra/
         ubvu6GV6CBslOPpz56QfiSiRtbBvi6vsYwXnZz0IxcvDymrLqmiG2F2kEavncEjyXdle
         ePP+uX3C4w8EA15TEnxHWxJ/7QKdbpMQG09KilB5X4xsEEqHIgoWlA4xRmq4O8LNWaBM
         BrSoiyjmBM1eyZ1ZbGxBK/hwSxnPiZs86MT72ohWrNOFtG6uHXbwATOtvmxKrBSRTefs
         lTLWoFRjNc17gcSOzR7hnoyPU+u/oZ64iyM8sW9vAdDDrI+JaIufCiQX9V4yHdMKq3/P
         6puA==
X-Forwarded-Encrypted: i=1; AJvYcCUZr7d8wz09y6P6CQ0J1pn0kyh7B8VGX554rd+SEqlJyVZoJTCigo4gFIrgk0USKL5W8tkWIFIxI1rOcG5t@vger.kernel.org, AJvYcCX/+UZpg42nOUmCUakdG03b6R2AaBnUZ3QzO7OEmHsEWaxhJXVeJDX2TWttu75vsuis8zKvwuKqowd4yYq9oG7/Lg==@vger.kernel.org, AJvYcCXuT/SShmhNhA4KWTNScleHwW37cpYe2zHh7xiNF2MfBSY8VFDNd/ZnmPX2p22IVI6F9O84gvEzYPbh@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdzMWMaOnZjVXoLD8Sb09Ab8RFXpJdXKyU4pisB6XE2T+jeKy
	X5pSH/H+sxRiNvReBduyxaYgDYjqozfES6SjahqjPgZHRU6nl4NdBWnttOLEV/Vbl0S//4G6dtE
	arm+YpK4uH600FpT6aEjVBq0PldA=
X-Gm-Gg: ASbGncu4eAGavPJMp1NFo51jcx0yBJJYw4K18p8yWG6bvRu+Qc6aUiS4H5awc3PQZXz
	/5byk0TXBlE6gdp3Sq8BZJfWuax/DSNhnxJY0m8rGWFkVNHx6jbHLiL8tfd9uZcBSQo0/tGdkd7
	6Gp2mh
X-Google-Smtp-Source: AGHT+IFumrADYMZTbshcR/jQQQzsoDviUuD373A59nqtY8JJ4DVQv9+RznKhnhkMPzfDVQnWCYD8iJq2w2f2vqoh2zk=
X-Received: by 2002:a17:90b:544f:b0:2f9:cf97:56ac with SMTP id
 98e67ed59e1d1-2fe68a2e72dmr6336504a91.0.1740490412464; Tue, 25 Feb 2025
 05:33:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
 <20250225102005.408773-2-daniel.baluta@nxp.com> <f4466c280bfef24be5d998299df450aa02ff2973.camel@pengutronix.de>
In-Reply-To: <f4466c280bfef24be5d998299df450aa02ff2973.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 15:35:08 +0200
X-Gm-Features: AWEUYZkXV-v2aTP1kBRTGqqig6c6PuH1hUgPphPti5oZf8llKAM919qLE-PCQwU
Message-ID: <CAEnQRZDrC4KEmOBM+LupCRSvNRxpBO0qnPaqG7HBRNeNOzO9sQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: audiomix: Add reset ids for
 EARC and DSP
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	shawnguo@kernel.org, mathieu.poirier@linaro.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 3:18=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Di, 2025-02-25 at 12:19 +0200, Daniel Baluta wrote:
> > Add reset ids used for EARC and DSP on i.MX8MP platform.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  include/dt-bindings/reset/imx8mp-reset-audiomix.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h
> >
> > diff --git a/include/dt-bindings/reset/imx8mp-reset-audiomix.h b/includ=
e/dt-bindings/reset/imx8mp-reset-audiomix.h
> > new file mode 100644
> > index 000000000000..3349bf311764
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#ifndef DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> > +#define DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> > +
> > +#define IMX8MP_AUDIOMIX_EARC         0
> > +#define IMX8MP_AUDIOMIX_EARC_PHY     1
> > +#define IMX8MP_AUDIOMIX_DSP          2
>
> How about calling these IMX8MP_AUDIOMIX_EARC_RESET,
> IMX8MP_AUDIOMIX_EARC_PHY_RESET, and IMX8MP_AUDIOMIX_DSP_STALL instead?

That's fine with me, makes more sense.

Will make the change in v4. Will wait for a while for more comments.

Thanks Philipp!
