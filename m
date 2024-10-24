Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689C1EF958;
	Thu, 24 Oct 2024 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792314; cv=none; b=tO+qeDUZq0AUwhyelVStcExew2CYO80RoCmURkWI/0GuBtNEVHt/9otTXXQpKcAFjtOqWrY0dFY31wUX/lj1YpmZANQ+McGtxWT/dnEdWYqcvCWbTVqfFNYPCW4Gg6eEv5OQhRaWo8o15elLJXG14P7Lt9XJWJ2YgnjRIncfkOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792314; c=relaxed/simple;
	bh=8w4FkZuTAZRD8tIK/zcaY70NIKdOANzX7cEzWrK1HeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwveesGyzQZAbuFNsFG2cTKL+j5+k6xX0JzukcsP1G8mlC6JKObljZGsL8YRZXg6mMe1uGXLzORlurrxLuepSvShx4owvfjjNygx0kI0daPc6rL/SPyEZzjbl5nP5qSm4jwoE/oj0llQ97pZxm5IzSZeZPhpPZKBjqRHxcSDNew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AF2rSP5K; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF2rSP5K"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so12008971fa.3;
        Thu, 24 Oct 2024 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729792310; x=1730397110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Efcyp3SDzmCPJL3StELfpWhprmNTMvCaAw5CutZ5bRw=;
        b=AF2rSP5K55U/ecKw0paNB4QjdXXLrOV6FTkbpSkdGBaRax77S6r50ZMN0xT0xPsxVR
         FtlRWXfvB1yfn2rTJwnyIqX76/AOvgVNS7wwN6hpmLG/s2F4z6OvlAOHEiRnRm2NlQRP
         OPDrLtae5yQS3QnaAoCbAanR+nTPyLi5pXCblTKflu5qb6RADDacYQCSeupMDxHYX8Xp
         v8ItPxvTw5u7KpqNyK2c7TlEgPhYzUDKrkPCcp8TVAYoOVNPss3txudCr8MfpLW8SLpv
         wkAOPUs4qSHIlbNKh/neUVZTpYdNlqPLXwLol3tL47sFsOYY027s2hP8IMAXZM1dQ6HG
         O7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729792310; x=1730397110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Efcyp3SDzmCPJL3StELfpWhprmNTMvCaAw5CutZ5bRw=;
        b=vcHHDgjzVwIpTiZYsMqY7iViQhfJEgMvE59s6eXbKvXf5kNOM+PkOAVI7YFXbSQ6dl
         L699D8NwidCQ+/NzwRQB6Y66anI+BJuzimDPgNOpcyRjFORXIKXyH2LSPZnNgpx96kgo
         eOXe71XFprRZeqKjoIXXNshAqnOEk4nlNJFXwlZnC4LACvaGkq/5Lm2E50V0Rp+YeSOF
         cXJmsJnfHLznFKYNve70flbJMAtaZBS/Lb4m8b6DgVHhme60HbD40GTBpvI2PPykTFPF
         cjLinut8B/P8aS6UfjSXx9VGWqHyfttVuupZWbnmNlFrYsK4TvM/1LGr/Wk3Qo4OnU30
         Gj1A==
X-Forwarded-Encrypted: i=1; AJvYcCU3WeiUphEwHb7a1ZcK2tms2xemu6NhCyjATHYhb/OgsSEQbuqtzqoNO5kiKOKCJn3MxuPeLyv0KiIsOPuz8rqk+w==@vger.kernel.org, AJvYcCUn8uTv5krgW0P7ePcfJDFcl71uUkEpwuD3aPccnJbJnJeUs2lGXBfFH/l8Nm/VawxDVBnhALl3R0oQJLBT@vger.kernel.org, AJvYcCWoiqn1vzPPRyLFpw0QFdLRq2ssEtlLXLL6mbSGPt1b6NliYENGFqFFQogJOSnvxkcEJ6KD5EXdNOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCRqstqIWkfUlSyTdT9OSXjW3SBgm1/7pjeL92vDFIUVe1vVU6
	nHinHp9nn3iW0M373TipP2X06UbrIHaV3r3V2vrRnOFAnOYhOt1JWUvS5YSg+FqeAyVwVy3xoT3
	KG7+xGy4rewhlZ5L+itVTn4+y5OMigw==
X-Google-Smtp-Source: AGHT+IHd56uEej9KHp8DRcc3RgdqdDgBGUcqJYSp6E3nREQVPHzju8LwaNtdtUDq7vGAKFPXKpPX/3PXtA+v1VeS27I=
X-Received: by 2002:a2e:742:0:b0:2fb:3c16:a44a with SMTP id
 38308e7fff4ca-2fca821f392mr16136471fa.19.1729792310192; Thu, 24 Oct 2024
 10:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023053357.5261-1-yesanishhere@gmail.com> <20241023053357.5261-2-yesanishhere@gmail.com>
 <Zxpq1RGltdWiE5sA@p14s>
In-Reply-To: <Zxpq1RGltdWiE5sA@p14s>
From: anish kumar <yesanishhere@gmail.com>
Date: Thu, 24 Oct 2024 10:51:38 -0700
Message-ID: <CABCoZhAdi24X5M1w=Qdb72CxUSHG-UN-t899DOMw_wVXG7K4rA@mail.gmail.com>
Subject: Re: [PATCH V4 1/7] Remoteproc: Documentation: add the main index
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, corbet@lwn.net, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 8:42=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Oct 22, 2024 at 10:33:51PM -0700, anish kumar wrote:
> > In prepration of moving the remoteproc documentation
> > from staging to mainline and also for enhancing
> > the documentation.
> >
> > Signed-off-by: anish kumar <yesanishhere@gmail.com>
> > ---
> >  Documentation/driver-api/index.rst            |  1 +
> >  Documentation/driver-api/remoteproc/index.rst | 20 +++++++++++++++++++
> >  2 files changed, 21 insertions(+)
> >  create mode 100644 Documentation/driver-api/remoteproc/index.rst
> >
> > diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-=
api/index.rst
> > index c57c609ad2eb..ec9d669b92e5 100644
> > --- a/Documentation/driver-api/index.rst
> > +++ b/Documentation/driver-api/index.rst
> > @@ -30,6 +30,7 @@ available subsections can be seen below.
> >     frame-buffer
> >     regulator
> >     reset
> > +   remoteproc/index
>
> This patch doesn't apply to rproc-next and I'm pretty sure it is the same=
 for
> Jonathan's tree.

Sorry, I cloned rproc instead of rproc-next. Will resend the patch
series after rebasing on that.

>
> >     iio/index
> >     input
> >     usb/index
> > diff --git a/Documentation/driver-api/remoteproc/index.rst b/Documentat=
ion/driver-api/remoteproc/index.rst
> > new file mode 100644
> > index 000000000000..8b8c8f512e2b
> > --- /dev/null
> > +++ b/Documentation/driver-api/remoteproc/index.rst
> > @@ -0,0 +1,20 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +remoteproc - remote processor subsystem in Linux(TM) kernel
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Authors:
> > +     - anish kumar  <yesanishhere@gmail.com>
> > +
> > +   remote processor subsystem is a way to manage the lifecycle of
> > +   a subsytem that is external to the Linux. The remoteproc framework
>
> ... external to the Linux kernel.
>
> > +   allows different platforms/architectures to control (power on,
> > +   load firmware, power off) those remote processors while abstracting
> > +   the hardware differences, so the entire driver doesn't need to be
> > +   duplicated.
> > +
> > +Mailing List
> > +------------
> > +To post a message, send an email to
> > +linux-remoteproc@vger.kernel.org
> > --
> > 2.39.3 (Apple Git-146)
> >
