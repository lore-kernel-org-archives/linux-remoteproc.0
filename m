Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55B30CDB0
	for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427854; cv=none; b=m4BEAUxiioW9sqfMTu+0FzVuOOvAT0leU3dKSR627IJCBPiDjg33JBB1OxFum4CHoflHE5D0qL739DcSm1Lch8V40GfkU1MCc0rOrz7WpNuFXT5d4WiUq6fJbpEO/gV/N8n+PUYYZvYajdOoY/KRhDA0p6eikaQx5I9EQA9MqQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427854; c=relaxed/simple;
	bh=On8iufHNupMUM8gQiRcj/sMjUlOBoIku4zCGN1itpwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqu0fB547nUgOkG0pB4qu/iwtDVbIt6iIgFJc9o2N0u9Lh8BXiJHLu3a8eaTquEMTElHI1rpopDxOR0PihSmZ1ueK1HdBiiPhbtl/sfTbfBE6BvBZ4TByFeG1vp8dtFoDQGhO/1GD1cZLIiCFaUlOLMeRzuy15RR0Y/qy95ANwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IyuxZMsm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IyuxZMsm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3c965df5so1570978f8f.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 06:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427851; x=1765032651; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctIpJYtrQV3nLKe/1NlZuGbTH89WBc7HNhCgLG2n0ts=;
        b=IyuxZMsmR76vTptkNE5lElzz/1qfJIrfVgY4Awu3WSbd/ALHao3ERTiI9lRjwUFmGW
         wGkTVKxcqSirvEmllIJAeL9QOiK7l4x0GK7OK5dpQZc7CrwPYtwOvqkEWh5FZTWFWFuc
         WU6thrTFKWFkpZNO09+MUYmmXYAnjMZhixzxWJ7UERIMraSe1EQNRg5nQGr+3b+NCZDo
         GZrKjR1Dcft+/bDK/wAe/OnrKrwPQhD67Y/djVlcpTiRd3LyNxt8p70YqH812uNMg1tF
         O0JsQkyLWEGhihS/ZYSCayoMmj43KsIOb1wGn81AF0cqoj2KuyYn+r4B+dEn+NxNtxkw
         h9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427851; x=1765032651;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctIpJYtrQV3nLKe/1NlZuGbTH89WBc7HNhCgLG2n0ts=;
        b=hzYu6Q7PxlZQoV5Cl5grFGO8FMxzFk+vVy2rdUOfCQY+fbpXCQ+JN2bdKsqbPPfFsL
         pyzkVGtdxWb4KEsdzOY3FCyRe9yxL3sXsG96JpPO/uby3Lqvp+jb0Ax0PvGDQWYD/RE5
         uXyj5yprSPJpDIAPK2JuT7isc0pITKF1HoClgT7u/Cnml+akaDg8bSADzdeD2tstuQ3D
         GY9wfK7TBXPVuu0Y14AoX8FMUBFuHbWoUCI71Oa1gEDs+VdJvBXCCHQYX2CbqTpfJwXs
         LK/iCHosxdor2L8H9s++Gvpx3sWpfWX8exMANkUN9rZp7iSKye2asHDc88h34ZR9Mk7F
         yagg==
X-Forwarded-Encrypted: i=1; AJvYcCXhttjv6mGp5rVZ+9rUAbDTNuQ+E1RD8CwTPiR+noOSKtKk5SimHrWQ71AVibU+wPIWeKJdLXix0+JlfK6jhMlF@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAljaIkQlyH/90xeegTfZb4If9tz23AjMpHW+9V3N+xmQLT+L
	DGtz9bpb8SZkyl11c1gJFrGwH25w9PnmqWpmCwmFOh+velEQjYvWvOHKdRWM/rhseas=
X-Gm-Gg: ASbGncshiz0pXJjXTDQs9B4K2Ad3PBlO9s6ZDtMymTuFQ4lmzZbjrtn+MjN+EbBvMoQ
	EqZ0wizGEcdT6Bs+zmgE0Z66FvkFqwECspnYTxxa+56N1PfMLsA0WODBk0T401OYhAqqXqpQD40
	R5FNLt2guJoPX4Fm/KWVHyC/Cu1KG0tliSq8YcSstY/aFaXCmVNxRkMPCeEc5bL2azH2xpCMHp/
	cRjyM+SiWoTMgKKLiq6WwSDUrlNyozKrOWG8hV9vx4mzZl6QSOKpiY6yTHcksIv6WagiogeOMLS
	cF6TxuawweZYa/oWcmMBX0lez+PUbtU5R3T9DMz/+7wWQ5RD/Q+1mRCyPh7YGD2tj+OpPzDu0ty
	C8AIs5X/lPnrecUO0FLbshKJHJLc4seIGE9bb2IXnaVGke8AqjNNgIb32WTsrgi38T1VX9cH4ZF
	EBadq2Gun0e2XytCWy
X-Google-Smtp-Source: AGHT+IEagBHd9lVZqVEQQFeawH/ZHO01RUoyPCy8iCQRfDy6+PBcG45QVAvcVinElE8Ql4ZFoPlYNw==
X-Received: by 2002:a05:6000:2410:b0:42b:36f4:cd22 with SMTP id ffacd0b85a97d-42e0f344714mr21478943f8f.38.1764427850629;
        Sat, 29 Nov 2025 06:50:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d618csm15509253f8f.14.2025.11.29.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:50:49 -0800 (PST)
Date: Sat, 29 Nov 2025 17:50:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 0/4] remoteproc: qcom: Fix devm_ioremap_resource_wc() checking
Message-ID: <cover.1764427595.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The devm_ioremap_resource_wc() function returns error pointers and not
NULL.  I don't know, if you'll want to fold these patches all together
or not.  Or into the original patch, perhaps?

Dan Carpenter (4):
  remoteproc: qcom: Fix a NULL vs IS_ERR() check in
    adsp_alloc_memory_region()
  remoteproc: qcom: pas: Fix a couple NULL vs IS_ERR() bugs
  remoteproc: qcom: Fix NULL vs IS_ERR() bug in
    q6v5_alloc_memory_region()
  remoteproc: qcom_wcnss: Fix NULL vs IS_ERR() bug in
    wcnss_alloc_memory_region()

 drivers/remoteproc/qcom_q6v5_adsp.c | 5 +++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 8 ++++----
 drivers/remoteproc/qcom_q6v5_wcss.c | 4 ++--
 drivers/remoteproc/qcom_wcnss.c     | 4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.51.0

