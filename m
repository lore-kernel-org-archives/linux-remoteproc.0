Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B321D63F1
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Oct 2024 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730221679; cv=none; b=QccMUHjEMYhn3dIo4l7UstzUNtB5OpqfIq7RtYsRnz/owpQUpP+kT1p3aZdKtHU1hOW1sQ2mMBcSU3IM8HMz0F9F/a4iBlMY/uNv7RIUSgpKRe1TpHiJOzHwy14sLSXc3bt8OpGCRk20NY6AqsxW25MsyppPHwGLbqiocYm0XvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730221679; c=relaxed/simple;
	bh=vMlcxqhH9M0oMBn2t50QyORix8uNGB6ufNOx9xzdqRM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ARscnN/Sp7FFyuyCVda9EmvQR+AZkPX1wBJgqFoPZvbjsUrKBMxEggn2+wddMwdc0C2eKXEh1v7XxjZQK6a63cRS9dFUmls1Yy1uQB1VVVj+2pY4KVXWTKOYrrfgRSUgSINRHXiC4mgZCoBJn3PRNyB5XnWFxi4+mwT++XerPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c693b68f5so61901925ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Oct 2024 10:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730221677; x=1730826477;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMUpO4GHw4JTvBKu5JvINhynu0MBcZcJA0tvXvTxH3I=;
        b=fjBhFMm6U2f2MQ0PgWe+PpujY7H28JX3TxGuf9n1J2FURgniQoQynBaCitbIqgec1a
         IMfZE4CtZz4PP5EK9N/j3brplcbv+aLKmGMFt8rRZY3nLr4AZaNYDpeyrhKByr0vc6jF
         JkgOSPuuQ0AMBkoUxokfzrRfmRhdocD3rkmxkJBj7ByScSlhPHQ6OgsTqEmPBq5PcBMI
         q3WK+67Hl1aQBnLFS/U2McO7yKZnax5pefxG4gWtuOv5SOeGpj3S3RMxHc3WQWx13ipD
         +xsKJ4x9H81EtjSeDlJc1DiCteGu18VDN0r+pG1gT5JXSnFvxllTgRm9kk6C2mTi7SOb
         iMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/RjF8Vzdwm1S7FKnTiyV1Ha4aQ4zYQjXKnhL7mALn0efUFYcthmw0mddhhiMYDuVzOUc+BYekokmAj50gZnL1@vger.kernel.org
X-Gm-Message-State: AOJu0YwcTc5t7ZDlgpHWJMTOuHLgnqmom/dK+mM7fcrWq0+1EjDyA6ad
	TdUjquwbsC7xWdaf+x1EUSntyhNOjO70gZsS6ojQtBXiCXJuqQdOq6KJ6PZna3M=
X-Google-Smtp-Source: AGHT+IHQ6hqt2GFIDvzxzB6z/d1rlXeJz0yqkXbJH8u2AzK+uLr+X4awDkW0ZAHg6kt+Bt1a+fJPTw==
X-Received: by 2002:a17:903:22c5:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-210c68ab683mr167590195ad.18.1730221677056;
        Tue, 29 Oct 2024 10:07:57 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46cd4sm68256225ad.41.2024.10.29.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 10:07:56 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org
Cc: hns@goldelico.com, b-padhi@ti.com, andreas@kemnade.info,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
Date: Tue, 29 Oct 2024 10:07:56 -0700
Message-ID: <7hiktasuqb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Robin Murphy <robin.murphy@arm.com> writes:

> It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.
>
> This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> independent, and can be applied directly to their respective trees if
> preferred.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

I tested this on am57xx-beagle-x15 where before this series, I was
seeing various remoteproc drivers fail with

       remoteproc remoteproc0: can't enable iommu: -12

and now with this the remoteproc drivers are successfully loading again.

Thanks Robin for working on bringing this back into modern times!

Kevin
