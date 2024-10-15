Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248A20822B
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Oct 2024 18:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015253; cv=none; b=RJXvxfbTVFlrYc3AxMbafAkgA3HH9VatmZzqv8AlpVDsta9yE5k229HTld7AmOEA661qm9wkBzoZxM0WGWHc1U9+MJ2hNm2IXgoBCqvvSp2xVa12N3Xwd8b6ZiX7p/Cx4m5ERXFmIWk82uSmMriEETt/o9wJ3Hszr1OPADYFcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015253; c=relaxed/simple;
	bh=5Sh7kJ87tPc/aZUgjzlccOuvyWIxgKzdoM+PZcxJTHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SD/vst43ON6ewIe5UPlTC6idohmh7S+WxcpKhMHjSbrXQahjezSkGcDMqwxi/uEvhtxk4jTBgiXwqgYSzC0QeFs7aMzPKHUYF4EA8oA8Qak9oENs9yZ1oNdHeBF2lFC54InaKjvzEx/z7+8NMXsqTB2Sg61vCw02b5aEQPXR+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=Z0wZssuL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="Z0wZssuL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e7e73740so2770159e87.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Oct 2024 11:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1729015249; x=1729620049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PcYrNsbw6IHjYMTuNLxXkYIY5QAui2/Ey124pf7Vrs=;
        b=Z0wZssuL6XDbaR7zjRVOQiAV7WQPWBoHXOcQjdtRYcg9ch5f3M0SZCxCKDZFQIWD9+
         GGe/kKUBxK3WQNcO6kQ2c8mCSTfDBjYhJP5+jbnONugmRmehvD766VMOk55rJ7hTI46a
         5A/pLXCVHsYGJqypRlxWm0fnCrd+/5hc10HfDmIsySKgVmq/Ik81o8sRiN199so4Ey9L
         sL0KaQjmCkEODMldJh3S5xzZHt547Zjm5ySmTuOhwG66Z93yxh+7gbNny355dV7N2CSZ
         S7DbkzJ+RE3HDnpiXrpNOqnStOWsW479/arkYhH/uEqVgKfk7ccdwgrrQsrJwmfFDAp2
         W/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015249; x=1729620049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PcYrNsbw6IHjYMTuNLxXkYIY5QAui2/Ey124pf7Vrs=;
        b=UUEZfF4A+MnKefq9LRgHAXG1yo9jkpI8hYfzZy9wjk3Hcjas8I1I7gPYpWrWLFySfQ
         bmiRT+nCMi7gzfpmV1+v9Spe8QZOYnaW7grm6fiAXhWaXaUQFcvOcy54DJEkkQwNGoYC
         qV+kmL5yEwfcJ8DW5Br4OzV3Kv0pLcm/sLTF/HxcBGVlrgEdwYf1R8SqfyQJSwPVUOtF
         CHJSujaHy0RG6GNud9/CaaJzLQrpj0ddho91irTtIUfsWDfHnmnj/UvWMep3iNKAEfvp
         OFGkRHp/7EDxl6Jplx4szOBavfNlrgZHNJsppqqAQTIIZ3UZnoFn+DY6bWm5KST1pVv0
         eBgg==
X-Forwarded-Encrypted: i=1; AJvYcCWsWIsaBCvfUVtX42xvAYKQZGltHqVN5t2fJV3+swVVhi9W+jsLeFfqlhSdKM/P+zGonBRbwdLW9oQ379PqtbhX@vger.kernel.org
X-Gm-Message-State: AOJu0YzSml2wLqZvQtCDMmaErSh7yEsZMZlzfu7uEN3XCXhr/7owanG2
	iAjsseraT/x9R9v6fk7yaXQ8qQyqbh1nBErGvI3Th/kmAlOTMFhE7MWB7NrAt9s=
X-Google-Smtp-Source: AGHT+IFMXOsAcBZZWVStKfE7LLIYDhStyMbY8vO1MusS7LNjj6hRuLd7x4EWHUDsYOZy2yuZG6gRsw==
X-Received: by 2002:a05:6512:3d26:b0:539:e67e:7dbf with SMTP id 2adb3069b0e04-539e67e7e4dmr4997923e87.61.1729015249316;
        Tue, 15 Oct 2024 11:00:49 -0700 (PDT)
Received: from blindfold.localnet (84-115-238-31.cable.dynamic.surfer.at. [84.115.238.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f55de95sm24449795e9.5.2024.10.15.11.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:00:48 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, upstream@sigma-star.at, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, andersson@kernel.org, upstream+rproc@sigma-star.at, ohad@wizery.com, s-anna@ti.com, t-kristo@ti.com
Subject: Re: [PATCH] rpmsg_ns: Work around TI non-standard message
Date: Tue, 15 Oct 2024 20:00:47 +0200
Message-ID: <3518312.cLl3JjQhRp@somecomputer>
In-Reply-To: <Zw6suCNC62Cn4fE0@p14s>
References: <20241011123922.23135-1-richard@nod.at> <3194112.zE8UqtGg2D@somecomputer> <Zw6suCNC62Cn4fE0@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Dienstag, 15. Oktober 2024, 19:56:08 CEST schrieb Mathieu Poirier:
> > > In my opinion the real fix here is to get TI to use the standard mess=
age
> > > announcement structure.  The ->desc field doesn't seem to be that use=
ful since
> > > it gets discarted.
> >=20
> > This is for the future, the goal of my patch is helping people to
> > get existing DSP programs work with mainline.
> > Not everyone can or want to rebuild theirs DSP programs when moving to =
a mainline
> > kernel.
>=20
> That's an even better argument to adopt the standard structure as soon as
> possible.  Modifying the mainline kernel to adapt to vendors' quirks does=
n't
> scale. =20

Well, I can't speak for TI.
But I have little hope.

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT
UID/VAT Nr: ATU 66964118 | FN: 374287y


