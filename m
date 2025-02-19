Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6046B1BAEDC;
	Wed, 19 Feb 2025 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953310; cv=none; b=mZDBWD8HnHFPxt3xug0HbRxi7r3U+sgoFdWspEf9f2EJoJ3O6crHO4fViPH41x7NwkldsN1SYSm+xVCFjOR/3SdYgVNClFk9KQ07ce2qiWIMtSxdAIaVnizdV295nBZt2O+pYB32zulfqbsjPVBQtjUrkjHA+tojLbO0Z6wwJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953310; c=relaxed/simple;
	bh=zvTczUtf8Y1eEofJZO2thlt6exdwrKA425Rp62SQESg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+oYzPlZI+6WWhS2s967k3XdFXeuVJTVTBqCBA014g0SkMCylCIP174zi7LShu0oe8w03/6aVjr016gYvsQ/tn1sJkHwolO8ZgKnSxZldrqQPG/39Ju/9faVylJFNhGmvjeFbNbHPbq1jmPALB1F4k+7IvXveDKQvVayZZzfhEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsb5hd33; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsb5hd33"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso12850782a91.2;
        Wed, 19 Feb 2025 00:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739953304; x=1740558104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CCUQvs7skbbtsR/YI3q9DDNHuUZH7nkoZeezReFSZA=;
        b=bsb5hd33OYDFm0ck5NRSw6Bd+FMXjpeql7sXlkzlUsphwf5jeC7IqMI6RSWGyTLSdz
         5Kyz+Ol/XfSK0rgGZE1FulrHGZLBUwqamEtKqQfVTth/9niVLnoCl1j+7dXPCYFfE1ZA
         f+qSfFcuRCTxAZntIiH+/iZjG6hKeIILgiUAd4Ak0ZiAYbGzuS0utmku0YpLBv8hILBv
         oLGpMCL/H7Oel8W13hklLZR6aApSNXmK5p2MX9ScjQscg8iBtXMX99ry9atrZG7IKyfP
         wpoHWyFurF+vNuxrRlcTtaZAiPRl3is+VxG6uTaeTcqf+9YMAjru+FmLnSbBA4HXztW2
         IPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739953304; x=1740558104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CCUQvs7skbbtsR/YI3q9DDNHuUZH7nkoZeezReFSZA=;
        b=mCgvVit2+6CHLduZA4eMuXWP+6Q1+Br9pD20c1sT3DzJfLD9tluDwylaGJsvorPo/g
         vmMzai+Caz2G9WGnjmn70HjE0YgUsghCbb8h1e14Fhl5H5ekr1qNAY7Lcsd6/FryehRi
         YJWU9lrXiUuZSoHMWaEyskpWW/qSVCyfDvW7adR+5Agyx/a/r1g0jT585Vypxc/ke7ye
         kTvmdvwe8efM23owBPTHH8Ikt+DxvCLFnr16G8ZGy0L8CpSTZD0IWsOyoFDfZu39uHcU
         kHfxh3RRoZf5zXKu78KC4NXXNAvm8usc3sfskPgburOY+6wf5pH6yYuK/u0iDZmAM2Cj
         xc7A==
X-Forwarded-Encrypted: i=1; AJvYcCUmsnS92WcMrMwLm0NFiYo0y3PWSShLWhKVLJ+emjBUxTDTXRS3tD66q1j5BJ0WaiH5Uw68zANWscRoPJE=@vger.kernel.org, AJvYcCVIn5vU2AYF545uPP5GlwMzAzsT4C+H+mbbYjnebdwtd+jM2fA+gzI8dZk7knkNWhkbPtKfc02Vy/r57ZDqOJeN9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBri2jZKoAM1hPP6SvLl354OsgwbuyRp6ZOXExlagWfGtR0/fM
	2op+fz1LQn5m0HaSBTJv1J031s49eBXqkUxLCDGEGukfkweRkM0d7G1EUoW0ip29GfUbCuti4CN
	voWEASW4x7LuOC9L0YBuLOB9b41MkWqjenCE=
X-Gm-Gg: ASbGncvIU1uJQRw25w/4Sz0+KqfTgSk7JkExPWtUwS4m7/1gTY9QutCy0+7w3pbr9kN
	6IgtHfTrV9Yz+e4uwwgUUbC56Jvvb/uQXTjpEDmOWP6zkPSU5lMIHC4DCElKIXOCHc8n3psyChA
	pb+LqlU7CkvLwGffimgfTdgrISoeO6dRA=
X-Google-Smtp-Source: AGHT+IFzIRpiLIjtv2iSzEdqta8V6rWObrEAdpRX7gMmj7WIN0aL5o3A9z+K6dA+admg76L3qNrsQ9fIjfYQvQGGYPo=
X-Received: by 2002:a17:90b:3b92:b0:2ee:f687:6acb with SMTP id
 98e67ed59e1d1-2fc40f0f07fmr26433153a91.13.1739953304594; Wed, 19 Feb 2025
 00:21:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218085712.66690-1-daniel.baluta@nxp.com> <20250218085712.66690-3-daniel.baluta@nxp.com>
 <Z7Stjh08+/RlUtek@lizhi-Precision-Tower-5810>
In-Reply-To: <Z7Stjh08+/RlUtek@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Feb 2025 10:21:32 +0200
X-Gm-Features: AWEUYZn3t8RO4hNneBNPP3WTziJtjhP1rlkqNpTqV_tfmebhGCfYSHFlLx1Yy64
Message-ID: <CAEnQRZAL1npc3-Z_O_7_-SWi=fvWkSv_fv2dcmVf5owVYsi0NQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 5:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 18, 2025 at 10:57:09AM +0200, Daniel Baluta wrote:
> > Current code supports EARC PHY Software Reset and EARC        Software
> > Reset but it is not easily extensible to more reset bits.
> >
> > So, refactor the code in order to easily allow more reset bits
> > in the future.
>
> Nit: wrap at 75 chars
>
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/rese=
t-imx8mp-audiomix.c
> > index 1fe21980a66c..6b1666c4e069 100644
> > --- a/drivers/reset/reset-imx8mp-audiomix.c
> > +++ b/drivers/reset/reset-imx8mp-audiomix.c
> > @@ -12,7 +12,30 @@
> >  #include <linux/reset-controller.h>
> >
> >  #define IMX8MP_AUDIOMIX_EARC_OFFSET          0x200
> > -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK              0x3
> > +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK              0x1
> > +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK  0x2
> > +
> > +#define IMX8MP_AUDIOMIX_EARC         0
> > +#define IMX8MP_AUDIOMIX_EARC_PHY     1
>
>
> Does dt binding need such macro?
>
> If not, you can use enum.
> If yes, create binding header file for it.

Thanks Philipp, Peng and Frank for your comments. All are valid.

Will fix them in v2.
