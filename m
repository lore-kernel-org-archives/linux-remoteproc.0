Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C86194C67
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Apr 2024 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714496376; cv=none; b=LPgF+CNTJk8YVLjXnBTY8KhVOkOJnQ6jvN1fD863bn8m8A1LUbce1XsBMLxxn+2fZGDmOe0Z9kur7ZryWaQFY/iWHqNy09bVpjpSjwekZLV5O99lYx2kioiepJq27g+skOOhUIimFEIJWbcBxHJdECzNspr2j8+BQngtkzDnc2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714496376; c=relaxed/simple;
	bh=R+EEWTKUw+xnpu64p6u8Ohkc7r7mBLTm2yumZi8kM6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBkwoFGGQo9T7XUPLPvBbsZC4CapploVDezeASUThloDDOUadPVU5M2Q6TN39y1eWmZFFM+Ec8TxbhN6psgHQtl1W8kX4xFn5rLxNQZYbpVj8SWgqZNz4yyZDoppOamQx7zvoPqe+L5/yGTz/zqNTB4IYPcbNIcdIhFo3rTCxp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P5yP3jf7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P5yP3jf7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ecee1f325bso5292933b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Apr 2024 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714496375; x=1715101175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCCS2R2FR9/FAipUn7TWN7sN6TdN7DchzvkmF3EICv8=;
        b=P5yP3jf7IlN8+DN2tuob11AnX8Pl5j95Sa9CNAs95SG/yz1fsRUh6NeKgFpBtIKg8X
         5UInm8iAMtcZl7Mvuzk3kKmpUMYVL1pLRNpb+YlhLjTo+worzgvSWn7kGSxsSo22nysJ
         7Nk/i9g+JIN/WLyiDBlGhq8Uae7SAhV2+u3Agew2p/Hm11b9kjYqZkCoa4g3H9+EIJsU
         6EdDCw3m4SllM5TTuwDR77PXV1I9UAPkC1SHwRc7nIHYx55v+GAy9WekXdHPOBx3qgRJ
         kCLFRd3AozCSJNBCZRFuVOINkDHTl/wdwNHIFhICP13ttQjrsOyYNTNU+9wCz9DkGi59
         p4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714496375; x=1715101175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCCS2R2FR9/FAipUn7TWN7sN6TdN7DchzvkmF3EICv8=;
        b=W69kJxAHOYD9a373Y7Omk8Y40BV6bmHGT5r8VANYTIQcVONY+V0PzaVsY35YD935Tc
         +kEh99K9g6LuSPb9vFMA5/sBPBurhMotMdH4POAudXmyIMidiQUAhTXtC2UAEavuYtmg
         i96CsNNytjqaJa8vfICqhkHGiEEW8nAZ6WxJkOm93Ax7cRWiwFTL3nqXY8O0Ug7kI1Wy
         5KYrhNtAeMFM33yFcZBACcQP13Nn973gn5LRXSczOgimt6gTq4YxGlWipJwB+ZIykmZJ
         2132OBIEj4jkw7NC8ZOpnd6Ed2nBcT+eUTRL7AlLLDTQjCSqBT7wXjDKqtsXarE4MmOo
         y2pw==
X-Forwarded-Encrypted: i=1; AJvYcCWT7M5Us/PMYBMGJyP0XZCsxdmktlab75K5jgVvjHT5xDSJYcv7ejuAnaJj8dvP4Lng8yV+/2O/M7LRs5BfMV80fSwy0u1/jZJh7nRUBmgxKQ==
X-Gm-Message-State: AOJu0YyHEU+oMasfS2bGS4dqpeYy8vzCtGXHQxBQO5XvMe5rjOlG0Ylf
	FzNuICFuNdMGtnQStpKQoKPfjjCGUv4cmCid6vOE/GSkSSGJy69iQ6Gi4bm4FCQ=
X-Google-Smtp-Source: AGHT+IGrgXXLXiCPGKlyYF/HhFyTUcDK+n3kbkIyjbNRzYyB3tH48qTUfmS21rhv5eklR0G4DqTnEg==
X-Received: by 2002:a05:6a00:2448:b0:6ec:f712:8a69 with SMTP id d8-20020a056a00244800b006ecf7128a69mr261943pfj.29.1714496374481;
        Tue, 30 Apr 2024 09:59:34 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2e09:6862:d789:2631])
        by smtp.gmail.com with ESMTPSA id i6-20020aa787c6000000b006e6b52eb59asm21266353pfo.126.2024.04.30.09.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 09:59:34 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:59:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, s-anna@ti.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, u-kumar1@ti.com, nm@ti.com,
	devarsht@ti.com, hnagalla@ti.com
Subject: Re: [PATCH v3 0/2] remoteproc: k3-r5: Wait for core0 power-up before
 powering up core1
Message-ID: <ZjEjc9kUaGuXYy12@p14s>
References: <20240430105307.1190615-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430105307.1190615-1-b-padhi@ti.com>

On Tue, Apr 30, 2024 at 04:23:05PM +0530, Beleswar Padhi wrote:
> PSC controller has a limitation that it can only power-up the second core
> when the first core is in ON state. Power-state for core0 should be equal
> to or higher than core1, else the kernel is seen hanging during rproc
> loading.
> 
> Make the powering up of cores sequential, by waiting for the current core
> to power-up before proceeding to the next core, with a timeout of 2sec.
> Add a wait queue event in k3_r5_cluster_rproc_init call, that will wait
> for the current core to be released from reset before proceeding with the
> next core.
> 
> Also, ensure that core1 can not be powered on before core0 when starting
> cores from sysfs. Similarly, ensure that core0 can not be shutdown
> before core1 from sysfs.
> 
> v3: Changelog:
> 1) Added my own Signed-off-by in PATCH 1, specifying the changes done
> 2) Addressed changes requested by adding comments in code in PATCH 1
> 
> Link to v2:
> https://lore.kernel.org/all/20240424130504.494916-1-b-padhi@ti.com/
> 
> v2: Changelog:
> 1) Fixed multi-line comment format
> 2) Included root cause of bug in comments
> 3) Added a patch to ensure power-up/shutdown is sequential via sysfs
> 
> Link to v1:
> https://lore.kernel.org/all/20230906124756.3480579-1-a-nandan@ti.com/
> 
> Apurva Nandan (1):
>   remoteproc: k3-r5: Wait for core0 power-up before powering up core1
> 
> Beleswar Padhi (1):
>   remoteproc: k3-r5: Do not allow core1 to power up before core0 via
>     sysfs
> 
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 56 +++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 2 deletions(-)

Applied - thanks,
Mathieu

> 
> -- 
> 2.34.1
> 
