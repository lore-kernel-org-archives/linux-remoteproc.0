Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940522DF13B
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 00:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757839; cv=none; b=WwgBvv9zFtt3WmzaG5eAtxwnjybtSnVIC8YOOhVEYRpQJq6ODNvYUlbpek0WfiRtlXOKy3NvmPCJc+ooaBbM/gGbTa4uqPjLQXaVyb/SdILWHJZnGtKgPd5DAdkXRMmd2A1R5jiHYhYlpzZM9nNmEaF+LoNQWY7bFZfg69bbu/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757839; c=relaxed/simple;
	bh=SwKQHqFPugEY5LBsRfzbny5oSAeUyqfWxPylHIWs5QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZBC1iOFzNgxVAT+sQj3wduuXEqiL/HqULthcN9Fd9NJw/RxouMVd+kOuPvAobXfJHRdaoUMmww9U5ou3nrJcQ1heU1KSoKKN+tZsYF/CCJ3uQWkWHkBLIfkrDg01O5K6L58KGdcgfllzPFCyCKQYs8Vgc5LPZsvRHhg3rCPGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCIl/OnO; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCIl/OnO"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4639279c7a6so3017169b6e.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 16:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757835; x=1773362635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5AiypmAgBLdMR9CuIx3DJ9/2CMWwdsmjB28iBee1fMM=;
        b=LCIl/OnOy9RfQ10XhstZa5HsHrYgab5cv0xfEj/fDZeK3CUE48bZCzHkBtYXcQqZCb
         IJwtYhijdoqpLeVEjuMyQGziuR/C9jLrxYHBWfRSR/AFX1a0OLBG72rfMBS6SHE0ubEG
         12PqrIdDBBe1z7CPa9as4c/5BuctiMaWbFGFvRRxdqFc+BAA+bDAvw8FdGJCs2ZNGio4
         B+QGzpyGw9oJOvVGT0M/Tir4fpPlJPxVO1DNJUArw71Lm/bOhIIXFOFqKIwL/yXHBY0d
         d8qebC5glmdhtf93nvj02Fc/hD+BCgbZIjPhx+QQdKqhU9l4cvpt7s3VJAcsotcflZUG
         5/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757835; x=1773362635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AiypmAgBLdMR9CuIx3DJ9/2CMWwdsmjB28iBee1fMM=;
        b=XimgD0CnI4GYao5+z67RlxK+FTyByEjzouJLdkIiuMH5KXcNgJGCsGKc0lNrdM10C8
         ozlQACeIUcfF1/j2VFYe9QWEN0SNTMIOz0oycSWOlEURNATbOyu3ARY6AsCChmUxvbm0
         t3QSkMukw1ugLBeZJNrxasS1TVMHxTQdqV7DJuFsIwsnw7O+J0AOV8wM8y6kU5J/44DA
         9Kk1uvBprQuCKLDiLY4ivSM0SzbtK82w+fhEAlNTMU5REzVQ8+l43QYpMwpRmn/xu+Kb
         I4Za1OjOSYafpx7rQ0QM8vfj8YHPWit1453FqnM1Xt/V0o6cuV7IoP9qNaa5mO6G2EiK
         Cp1w==
X-Forwarded-Encrypted: i=1; AJvYcCXf3zrHoI4LP/fBwNazGw7DOG6waeTE8nzY2a6TB/BVNNuI66rLPw7L/4ucx/Ra5u6FWKsjmrfPUH9mZ/QXx0nX@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBsCO43NBOMJLwJt7t9Q+Stlk+tRabd8DGG09C9Dxn308KnR5
	2E8fAvi3v/fwymMDt7KDE9qXe3qW00a6twH7CTgvN2G0j9zpFhye5yOz
X-Gm-Gg: ATEYQzw3Njl7vg7h86bNxVpx4BJVE9FDCjc1LyUSkW1qVW9PJYBXoPiPhv4QfJhKDvU
	t7MLO1jWsUkCuktTPDXuUJf/VC2t01ia60WBvtgfyIj4BFLV+RdBjnYDs9d4eBTzU5SwJe+QkwL
	hiVB6kYJB2FCMJ54+K467DNGdyvYThZ7caLyZuKRQ6aIc+BGCHfnCtXuqGYeGEJ6qNU0kLz114j
	ugqUxl2SxxSsHLzLaKejRVkjH1UyeCD/AMBkpP0vv6LN6ZFI5VhZz2DnOJFx0Pa4NnptFSmGe8w
	lXhetQYLvsEj4lN1Oe0hmRd+2AIRUCrp7t9rbpzXeJY336RXPK7IQvjDVjP4pSqoUkRm5d8KfMr
	4SfEhqarOp0V7gtdJctlkOtxQyk64BpYx1PGT8V5KKRvw/XANUbwNqeNybhNbKh20Bs9l/sEcH/
	vrQpKdQbr9b8TPKzeLDJg7r0NY6XdM/DAG0SZBpmeM1QkqYD0BrdT7BLBBSi5vbc5LvVR5dx5fV
	c0B3LMF3BEFo7C7T8wtgpqjzCv8mvu3XiESOxAIPA==
X-Received: by 2002:a05:6808:c3d5:b0:45f:13fe:4a2d with SMTP id 5614622812f47-466dc9f4738mr204774b6e.4.1772757835483;
        Thu, 05 Mar 2026 16:43:55 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm69335fac.5.2026.03.05.16.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:43:55 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v3 0/3] Add support for Qualcomm WCN3610
Date: Thu,  5 Mar 2026 18:43:41 -0600
Message-ID: <20260306004344.10968-1-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCN3610 is a 2.4GHz-only WLAN/BT combo chip used in some 
cheaper Android and Windows phones such as the Lumia 550, and 
IoT devices like the Anki Vector robot. It shares a lot in 
common with the WCN3620.

This series adds support for the WCN3610 across the necessary 
subsystems:

   * Document the new compatible string (patch 1).
   * Add compatible string in qcom_wcnss_iris (patch 2).
   * Add rf_id and CFGs for the WCN3610 in wcn36xx, disable
     powersave for this specific chip, ensure it is 2.4GHz-only
     (patch 3).

Tested on an Anki Vector 1.0 and 2.0 robot. Support for other 
WCN36xx chips has not been affected.

Changes in v2:
 - Move the Documentation patch to the beginning of the patch set.
 - Move remoteproc compatible string addition to the middle of 
   the patch set.
 - Add Reviewed-by Dmitry (thanks!) to remoteproc compatible patch.
 - Move wcn36xx driver changes to the end of the patch set.

Changes in v3:
 - Describe the hardware rather than the driver in the 
   dt-bindings patch [Krzysztof].
 - Describe why we need a new compatible in the remoteproc 
   patch [Krzysztof].
 - Describe where the CFG values came from in the wcn36xx 
   driver patch [Konrad].

Kerigan Creighton (3):
  dt-bindings: remoteproc: qcom,wcnss-pil: Add wcn3610 compatible
  remoteproc: qcom_wcnss_iris: Add support for WCN3610
  wifi: wcn36xx: Add support for WCN3610

 .../bindings/remoteproc/qcom,wcnss-pil.yaml   |  1 +
 drivers/net/wireless/ath/wcn36xx/main.c       |  4 +-
 drivers/net/wireless/ath/wcn36xx/smd.c        | 61 ++++++++++++++++++-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h    |  1 +
 drivers/remoteproc/qcom_wcnss_iris.c          |  1 +
 5 files changed, 66 insertions(+), 2 deletions(-)

-- 
2.53.0

