Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD121ABA5
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 May 2025 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687023; cv=none; b=tYZX/6cZW1FfUjIn+xYfofaOWfPfDVb7WM9oBLK+gSDzrX4jlg7hZwSlfifM6JVR13u9b4vsvwUPD1u6KhzIWrbjcLqb/rckuh7e5sphwBeAJsoH3yibhzewyZY1i/xyteRg2i4LC6+uIv4RNpblvqTgPS1nWjvayPScXwtAPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687023; c=relaxed/simple;
	bh=VkMWVX/SiY6jp7xQYEDQPhAzra4q9xN9l5OzXXCtRQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgshBJimvqVoyjY1n95BvahyVfJa6KTmardmElw661UIxEiFUNjX2NfmCgIrcfIWdQ4L8Xx4o3+OnrIct7LKpleEEsgCso5h7N2BP04dmf2qUWBE0K7sNf/ptPWsrRFPxgH1AvDYx26uNbtE2Heq9OVzh6ruLRMAuQOGOGUby+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvCxnK0s; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvCxnK0s"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso6890535e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 May 2025 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746687020; x=1747291820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sswvW9Qq2pJQk2SsX4r7xkXE6gJyDJCPnoM6S1kt3zo=;
        b=zvCxnK0s6A4TMKeYk+qWdaYlOerjZgCOO1WTfcxDArPXLQ4QTIfo6XFiUKO1xJXw/B
         Juh5oMzCCqJfb+YkFGYf5QHfd0blmu/T5ORSUaAuoBYNLaDZ/3U6P7Y/2WOfQgsU9c1J
         5mgUB6O3CXfEK6PXOF1COP9fe/EdKA+Q5UPPROxrTDGmAvWQ56cvbidPXT8N6ZbJqtS7
         wV4Q3KBeq5roDP2kQpKU3LZDPUr5bNJ3kH3ArhP7zCK5dVfMQRdIqXY+TrvQrQa7Xij8
         dVEeUOU7xkhT4HZ3qv5V4krYClheMzXyfA0ZC3RBSCXHbMHI+c5L8FgiPcaX0sQn9x6N
         Z6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746687020; x=1747291820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sswvW9Qq2pJQk2SsX4r7xkXE6gJyDJCPnoM6S1kt3zo=;
        b=lvjj5HNRYRsx+wp1SgBEY5J5b4lkc9DUssk/udIySO7CmZVwoLMPujAM7/vjhPxVMN
         j9xPlink9suYh3EmV31riwxP8k+5b//WEpIwbrXpjSrM90XeXrhA0l1yaD8VtJKLZllm
         VZMfX+gtVOzEJEEYileKdsWImxf2IlztJUfi+iID5+Oojc9PCShKrUVofWnhwHZu8oTE
         MjeL8hkSSHavvYT+gLN9UI4FIXy85AC1lyUDgiob5p+FCB/nzsPMLpXEwmsERslES2IG
         w/wNidZETkgKnto+IAJLpiWllqv6rUp+d1k7K7mlIbL4TyYX/5JLYPH3uJcn/lfmOBbt
         GF/g==
X-Forwarded-Encrypted: i=1; AJvYcCURU8kGSWu1w0cdooV41xA91NYhG20zjnTdSuH13c6OqnXcXEa+pKQJsPKoFIhI0m+OT8sVLFiMzEbEjk52Xsb1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/ZdmRZvHQes+CPToj/PaCkaOGEr1RLa4NeHpCm2PFYNbpT2K
	apT5ZqCeq2DPhDzK9Mm5g7eoiR18CcZyHCA9Ju+txXXMeNXqY2yMsxfc7BtrfkKW4jOaSQbcGFg
	+
X-Gm-Gg: ASbGncuDMB2gnHpPvo4Y6udR2EvUXim9GzL2Y8TBhM+F7jYek1LbVmxdNKLqsv+Xda8
	kSbd7QQrPHRDYUXXEK+kJpFSJ8PLrN+GbTndaxUp0Mi4Ykcr4YMDvm3HLsMemmlsbBm45XXnVEN
	j8DXRj7VpkR/6v/fj6OLeJjHpWG/2NRTM2B2URgClOEmTEILnIFDvHCMUQi68xYG6KtgU1BT3gL
	gVRNPpMI7KLBGUxTjwwW3thiOT++QiFhf+Z+WawrbaQCjGWrJfc46+Hr+C84BCtsKy5JAa5t8Xy
	GVMfT/zE+V+vqcmSvuTTyp+S3S1z++xlsoxZgv6Frn0UNA==
X-Google-Smtp-Source: AGHT+IFSnH7/hk7YsAwIfMrID1Szme78bKEZ0xLGnBiKKY6ADD+OwDpp3cph0URuF50p1QHS0OhXXw==
X-Received: by 2002:a05:600c:3d15:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-442d02eadb4mr20122025e9.14.1746687020047;
        Wed, 07 May 2025 23:50:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f3c2sm26019325e9.15.2025.05.07.23.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:50:19 -0700 (PDT)
Date: Thu, 8 May 2025 09:50:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aBxUKEpdszTDduMk@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
 <aBxR2nnW1GZ7dN__@stanley.mountain>
 <2025050852-refined-clatter-447a@gregkh>
 <aBxTwhiMelFjvrjP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxTwhiMelFjvrjP@stanley.mountain>

On Thu, May 08, 2025 at 09:48:34AM +0300, Dan Carpenter wrote:
> On Thu, May 08, 2025 at 08:46:04AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 08, 2025 at 09:40:26AM +0300, Dan Carpenter wrote:
> > > Hi Greg,
> > > 
> > > I'm sorry I forgot to add the:
> > > 
> > > Cc: stable@vger.kernel.org
> > > 
> > > to this patch.  Could we backport it to stable, please?
> > 
> > What is the git id of it in Linus's tree?
> > 
> 
> 77feb17c950e ("rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()")
>

Ugh.  Nope.  It hasn't hit Linus's tree yet.

regards,
dan carpenter

