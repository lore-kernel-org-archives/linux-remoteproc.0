Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B603D76
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 16:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113872; cv=none; b=IDvNyLjD0UtjRf5/aPyJYaZfXxCgD3UypHv2H34+AZEkpWHAf2RgO37cRTB3j7ijJ/WQLR8X0QF4grAoj4xFpMSzfC9GKw4hiDhJVkk/pS0FtMon4nF6mXR6jDQ7jDj7EZsUklpDqWN0Y8KaHYtJUqIqIDi/UjDM3uOAdKJAZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113872; c=relaxed/simple;
	bh=sWau8pOuRYNhtAxbaAcaiNz5CW5zfAxPFLtnnDYBKqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3HuqTHyLDzg50zelNfDVYOAr27NePEkOyIwy1UvZpFa0dt6XB6osF/lsT9r98TTOg9b/JTgd8066MLtebHRtIM71ZB8yEEyEgZ3w9SrvLDdVPsSyMh9YPGst+Stx80Ox98lG2g6hsNbgyNP9IsLcucKOFP8p3EYAICKmTerpgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UazpeJin; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UazpeJin"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-271d1305ad7so37716515ad.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113870; x=1760718670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PErgUidAcsRKwUXeMVve1SYZIwtC3TkFLkv19Pikhc=;
        b=UazpeJinkjHVb5yWVeizpYYLLDLBC8b/0NuRrhVedtVEdaup4WWGY/9iWfE9Y9ygrc
         pH2j/F1dFIO/wLpHyiTxKJJeA4kNjLtTy4g0BfLb1N358S8r5pLVjvND/kb7cdafspo2
         rRcmQZYnjCEAQSzE6jdNPPgX4WrYKDh/kj4Gi8pe5Ky/E1iPvqbAxCh2cJb/1JPPWyXU
         PVTb3CkstrYC1qsMM/SjlrbK/uTDzQCZnTEFYLoMwSnUUA27EKs6oTvP0NiOZLJ3hXp3
         7hPkhA+RYDPe/UdnuORJqlnAWFU6r4bkY54wt9yNVDrMnoC4cmtpi6bgjc0T51dXdGU4
         Tj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113870; x=1760718670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PErgUidAcsRKwUXeMVve1SYZIwtC3TkFLkv19Pikhc=;
        b=JEJHlq65u+S/BugntYA+wfoSDo71BDAEn5Ez8WS67Bd+bMrJ3y80g/UMmrqAf7v0ID
         CD6i39Q1RVsm59X/5ohJHQDy4Db4jYP5b6wwX0YvD9grxsRH7Kwinp8waxxPMs87fmAZ
         0lxDqIXOFYJUDn10qCZDeRcE6Jcbjdk/JPACRzyTJjr8UWwy9lEOjVaVrFGalf1Zthgh
         sH142kPqO/yWazps9RW0Vpe68KYCtLeNhcGd1++f6SowqIDx5eCFjYS6vuZaEr2tsEpU
         fWhJFRaujfGodLW+ZU3jDiZKJgjHWZ3l5XwcbPQd1Zni3cDsxTx/QvFEVZ+2wIY/cOyL
         fF8A==
X-Forwarded-Encrypted: i=1; AJvYcCXniSOXfl1CvDlMG3JNmCdTKwR1EXN4sKZuyGjJnUlJ/0XKScOLIitV+MV0QjS7n/cXUo8sDB4yPeeD5GdegmYz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDH2KR1LuPn/5U/++0kYpgiMJ1x1xqGn42WxYn5A688gODLX2l
	/W24SCh3Imsc2RgzDSefnv5DdpVqwqQ0SXNzXUqa8FqwT051UE9HLcOnZ4SUCJYVRxg=
X-Gm-Gg: ASbGnctq4OY2rhEAak33+rxzhn74GW6HJ6oTmvLkj44jeYj5QAOCr7P86TdD6sd+oif
	f3VQh8h3UDKRZOWGP3LTd4wx2MC3ySPSYfiPZE9KLak4R2QqBcGrlCws5TqhMOtBCHqm/TOwtoq
	DuuMJTFjHOAPL99e7IdB9M5FaKdm2LW/DTS9kFTg/DpjgjHSl1fsk1CkZVW7Fia/d9ZkfnRFEZt
	fiLRM1qYHVIgSGt91td0j2Tb0KzVJ2eGqw0L9jz1yNSwHcjIUtDhWDPjREWEF8BihW4/mwlz4tO
	WTzMtKl/6eGE+6q8I0kBQcGWMwBPcTzoMHEyR1jEwGkwKeGmGCf9ahLwdmjOAMa2tefHe+OcJY1
	bbxDBVvFfZe060rAX79cky28RyFZeMdzQapH669kr6yQcddI=
X-Google-Smtp-Source: AGHT+IEy8L6TDg54FExTrOyXceAe8pz/QOf459ho/0ZYB36VftdLiczXdkNEiG5CFEJM6POervy4bQ==
X-Received: by 2002:a17:902:fc46:b0:27e:ef12:6e94 with SMTP id d9443c01a7336-29027418f97mr152883735ad.55.1760113870428;
        Fri, 10 Oct 2025 09:31:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ad30:d3d9:45c5:4a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm61182205ad.121.2025.10.10.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:31:09 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:31:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <aOk0y8xTi9hoGvyX@p14s>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>

On Fri, Oct 10, 2025 at 12:58:38AM +0200, Andrew Lunn wrote:
> On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> > On i.MX SoCs, the system may include two processors:
> > 	- An MCU running an RTOS
> > 	- An MPU running Linux
> > 
> > These processors communicate via the RPMSG protocol.
> > The driver implements the standard GPIO interface, allowing
> > the Linux side to control GPIO controllers which reside in
> > the remote processor via RPMSG protocol.
> 
> I've not seen the discussion on earlier versions of this patchset, so
> i might be asking something already asked and answered. Sorry if i am.
> 
> Is there anything IMX specific in here? This appears to be the first
> RPMSG GPIO driver. Do we have the opportunity here to define a
> protocol for all future RPMSG GPIO drivers, which any/all vendors
> should follow, so we don't have lots of different implementations of
> basically they same thing? So this would become gpio-rpmsg.c and a
> Document somewhere describing the protocol?
>

I haven't looked at this patchset yet but I think Andrew's proposal has merit.
 
> 	Andrew
