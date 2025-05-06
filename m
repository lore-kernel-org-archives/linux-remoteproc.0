Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6890153BD9
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 May 2025 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552514; cv=none; b=BuH91oglNZOUeWx3UUU3dklgz5uOv6xMSSttoduOBvZtnoHjsqP4vcT27EVY5wB1qQmA1wkyQxk7ZpQx9iEMDprBhCyNPeiHfNpVfoti5Ln3J94bTz1R6Pg8OV+mDRWv+xnGbSXMGaBjTyKNyKy4vZgIEPecX5cBfVChVOxkguc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552514; c=relaxed/simple;
	bh=yRbNgztRonQuiaVRF+GtZA9MZXlr0FC8Lulfmj90Y+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hehzo6I0OoM9MvOphvAnQVj5N+baO7VSgD14FyZxI8CKhbTj+XNxiiJhkcOzdvACyF9Kpux3x6z9OHOkmq5dC6NP0slvf8xcvq+eN3lRpFqEWHICbFNZNoWCPwNLggcaLEPank7T7+4XeYGB19mDjZz5GCSWFAD9pZaQzm/JyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXcPiEBQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXcPiEBQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224341bbc1dso79550015ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 May 2025 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552512; x=1747157312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PA5PfY6NY12/5Zj2EnrTQIT9NGofA0ZwpHxyeT273M0=;
        b=CXcPiEBQyar8YP1emyTwkcMTlwGGAqzh9/Pcvf377p9JlAY0fZQi5UolQFS4Hn61cs
         Ct22hI1QW2WKaw2f418enNXzL/fsvr4t7FTME4PP4LcnuLnS3rarprQvWL/fUxvnFafy
         dHka0FUEcvriMj1EhJxplieLc5PYSHOuEMtKTeBw3BjSQdI4SLMp7O21FsZHVQIE9NbU
         zSwxoEa1iU/G3wKHFNWwuwwrR0c4yKPVnbi/qxM1NFPKlQ0haQJkctBoHGlh8wpZlipR
         9pSXRIg6fFsKQbqHRIdVRHY4OPdX1V2eYsAPGxXEq4+8g/XYMwnsejgNNTn9Efio0z/6
         17Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552512; x=1747157312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA5PfY6NY12/5Zj2EnrTQIT9NGofA0ZwpHxyeT273M0=;
        b=UIoctQMoes7pldEBm//BRDXa2LnsFGzTN+8IRr+YIkjrjyhuNoSOoRqrnpiCfXP4Bh
         B0BYsaxGHxaAGLY8yZVgFSqcdh9eWEVjx7zKnxDn5oHKzJCuXz05VJLMNYohauf+6NIL
         Xy+u6KuI7fKMpGTJlxTWYAk7BqYg9Cmu7S4B/y6oyyoo51eg3WCFrG5+pIz5CcLzPuu2
         ZGF91Fc/4WhpL3u+HzJkfoybvc8ziR+6Tk8bE1wUNhJzmYKeijGiUk05DQNNYy55b0Kd
         jXA7i09282MdtAkteQEMqcwbC0aip52Qj2pk50E/2Hjme1tF4xVLzuEbpKgr8kTGcBNm
         bd0A==
X-Forwarded-Encrypted: i=1; AJvYcCVGMSoe/LRq/KMa0q3snVfE/lWcRMf7Xzy1sszgeMuB295bp6sE0gtQ8CKI6g2A6pLcyjsDr2oOtcTR2vJ3y/bS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4LhztYT6x/s0+O8oILlXIQdF+DeCQgEOgaZhcSE+MNVHnlFj
	bJXj4UG1VU2dOLHfV1k2l8VnlS3nv4BWDTOtFAlNY4PlXVXtgeSeIs53jNTkMTA=
X-Gm-Gg: ASbGncs7a66IXAPCaPQkaM4cMvMUNl7hvEGmo72p53yarZqH8T6rvtyLthACtL9vAFr
	GbWYSxt8lXchb3ijf9MXgtLE04Nc/7iB8f5NUy8IFkPZQxSj//pn+Jzl6LepHXZ8cPMU9FZ5fhy
	JltPPcB68OlrR9LYHeJls+vRCeq1teZofzOjlUwqVq+nKyP+XnH7Vc95gSh/qFza+AJTC+WHWYS
	osRktCyh9+CVY0/8+ORJWlYZUSLt2kjTIpRTFWlwYNzpDtdhdrFoLGDsjdJA6BZEZPmdjL7Xw6Q
	LvgJ8RcX3d27/fn9xyRtSzDgJxDQLEZFJuYgLxvctUS8
X-Google-Smtp-Source: AGHT+IEp4L7HwxTnZry2N9O3p9S78d/8SkvTPJNQn4jH71NKYa7pBIcfwdlj+kdoxFRV2WoW6lG3zQ==
X-Received: by 2002:a17:902:e5c8:b0:22e:421b:49b1 with SMTP id d9443c01a7336-22e5ecc5e65mr928185ad.48.1746552512052;
        Tue, 06 May 2025 10:28:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:18ea:e7ed:8d1e:88a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228b9asm76211715ad.172.2025.05.06.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:28:31 -0700 (PDT)
Date: Tue, 6 May 2025 11:28:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix two memory leaks in rproc_attach()
Message-ID: <aBpGvZ4U6VFpu1gl@p14s>
References: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430092043.1819308-1-xiaolei.wang@windriver.com>

On Wed, Apr 30, 2025 at 05:20:41PM +0800, Xiaolei Wang wrote:
> In the rproc_attach() function, if rproc_handle_resources() returns
> failure, the resources requested in imx_rproc_prepare() should be
> released, since almost the same thing is done in imx_rproc_prepare() and
> rproc_resource_cleanup(), Function rproc_resource_cleanup() is able
> to deal with empty lists so it is better to fix the "goto" statements
> in rproc_attach(). replace the "unprepare_device" goto statement with
> "clean_up_resources" and get rid of the "unprepare_device" label.
> and rproc->clean_table should also be released
> 
> Changes in v3:
>     Update patch1, replace the "unprepare_device" goto statement with
>     "clean_up_resources" and get rid of the "unprepare_device" label.
> 
> V2:
>     Updated the commit log of these two patches
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-2-xiaolei.wang@windriver.com/
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-3-xiaolei.wang@windriver.com/
> 
> V1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-1-xiaolei.wang@windriver.com/
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-2-xiaolei.wang@windriver.com/
> 
> Xiaolei Wang (2):
>   remoteproc: cleanup acquired resources when rproc_handle_resources()
>     fails in rproc_attach()
>   remoteproc: core: release rproc->clean_table after rproc_attach()
>     fails
> 
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

I have applied this patchset.

Thanks,
Mathieu

> -- 
> 2.25.1
> 
