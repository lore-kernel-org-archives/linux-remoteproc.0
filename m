Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D8C4F898
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jan 2024 23:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLrD5CGy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so5617275e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jan 2024 15:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704929068; x=1705533868; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bXdCSAERfdC3ufGBFsZzDX4ZCchcuIOZkqr7GpBVt+U=;
        b=bLrD5CGydYP+prmjitK2EIuf67HIqGKqTSrId4XfyIK8uj68tPxRmkdfBO1u0nGcRf
         azboZ/XRlrScV3koEBarcB1kUkqN31kvKA8sBuQ+L9egFLPtf09b6ZNvnzkdH1qnRQg0
         QSGs/NXlwKGfcPpxG0/PZpgZUOw5mVrb/JR6As7SxjzcVWofhtYGqSegWArxakRQ40PC
         /40BGn8eLTa1GAI1EYCP52V4PToX62mOacdQtBhemd6wwxS0ZM0OOHTLBsQhXkHqBCxU
         hZKEduFs95ppk1uKiYdfAuZrPEQZeQ0pWnsySTEXBSg45i1L03M06f+AXu+Q1iEBT/4o
         Iy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704929068; x=1705533868;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXdCSAERfdC3ufGBFsZzDX4ZCchcuIOZkqr7GpBVt+U=;
        b=oFSKKtsboL+zW3IBEoqq9+hao8aSCrIRafGd9k6Hb2Lbx7u5OyLe/4hkw4yH7UtQh3
         tlVnUQ3P9t0hj/AqDMxJ9uW7bfofmfp4dbk6wq/uSxgycb60+I1a5whhYAvUDtgT6hjr
         YOgz5dKUdS1SmQp7O/esGpj8kqzX7C4CSH0giyauvrG7XfkrbJES52H2zmaFU0fNzGK3
         b946Mso8z3EoPy65vh3qbfAlI2hrvJ/MyyI4FR6TfYC14WAeZ/rizgenvjiBct8ybfRo
         eH1b7bWjfhSR9c6P3xJe1OUdYWqf3g6nkG8ZqWimtDOr7zvbs+Eka6AntMLe1w+UHXn0
         BhPA==
X-Gm-Message-State: AOJu0Yz9fZ5jJtzy4dPWLg8PNXEazl/+vJcFiopoRezvQrFV/rEOMTwO
	SxANnyPNrgQ0KGPiCY1FdJSpH0KJ1GVrEXU7g67ELTwX/Z0yOI3BIUdQNPkMWrY=
X-Google-Smtp-Source: AGHT+IF2agn/TOOW2NYtiCNaKvq14ZlD3W9b0S0xjx7BTjOCTaYn/VMUfvOYUy0kRDhQmWh2C14OL6CzqUvlPFX8Gb8=
X-Received: by 2002:a05:600c:3145:b0:40d:5d9a:adc with SMTP id
 h5-20020a05600c314500b0040d5d9a0adcmr93115wmo.11.1704929068107; Wed, 10 Jan
 2024 15:24:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 10 Jan 2024 16:24:16 -0700
Message-ID: <CANLsYkzx4xDPGbywNiZ99vJ_r5T72qqwyXSD3NZahB6hovBdrg@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for January 10th 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH v4 0/2] remoteproc: get rproc devices for clusters
[PATCH v2 0/5] PM: domains: Add helpers for multi PM domains to avoid
open-coding
[PATCH v9 0/3] add zynqmp TCM bindings
