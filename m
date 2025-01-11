Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3F1B4F1F
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620988; cv=none; b=ZNGKqQ68X7gwt3uVdTFThGaeXq7ApHbobZL4ikW1ywAmEg0COHQpvQhZS9N5Viwc04odQ9KBFBRUccprxhNH8pHah5k+zGYwZAt+VBZzv9QlP5ifk9fz3utfGWu/+Hvj3JW0fOvy7IWODd5vO9UAFc0kEfTDXBNSIxYaPDpQLI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620988; c=relaxed/simple;
	bh=JoDXg2TSUGEGvFT9+KqrusBFwUg9j2HcgkAj/LYtsMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a7JmcGl99OIQ6o119JLfej18zlpp/NJ6tlzhEm/20WEbf6n/PbOMIoFEnkkM+dGX9TZSSobtp8Vb+6kVj5+XiQYx/wOaE6V0NCrECGAdl4Z5QkK7rEQ4E6uHSErdxBiAxObNqC+LUD8snqLgFc7hQ22t0BOXwDJb+HBzCBpte7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X/Hepmsk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X/Hepmsk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43637977fa4so2876125e9.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 10:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620985; x=1737225785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CbrdSND3vKdyA3f5oN4X3+B3XcZTSDcg4IBBVmOErE=;
        b=X/HepmskTiy7nm+kOp/lybUvK7wj2YLvxGQQozsVnewJ3sbMph8eiiZb3YlN5JnrzA
         L5v+5hRyGRDJ0u7+pTonj0BpzSbOL+2foC3vcwTjPfa0W2hYlY2Kh70M8tl++Czu4P2r
         SsKPDg/HuNmtMOf+wHZ5Ej9Rh94TLrjaZIxGeMhlfDLTAKtaKtV77Dn7L65JVfRHd8T0
         dc+bBa275J2iEKpSBLsxBsb7GELzZasD3/vI7VBX/zB4+LSfFHAW6XDBivPYm1EpryOu
         S1gmQxBNQg+74HI2v9/O3Pr1BqFuIQjdhv38gVrhMPQpH6bdoLKiDKH6nu90JhC19/4q
         esew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620985; x=1737225785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CbrdSND3vKdyA3f5oN4X3+B3XcZTSDcg4IBBVmOErE=;
        b=xMO0Gb01dHGReE6vNVAY9+JkIR13hnTChHbBRJUSEWBRlTG8pk4zDgZ8QwxigIwtAz
         6XS+Nj3Sjmz0VqkgMyT/GIIXXLVobkgu0f1phV94seConyh1C++8N2UfiYtXpxKZaHue
         8dY2/hwtaEX8vll4lTHDEZ6UVTHrR7WN+2U/Wjvl3yy5ff3A4E3NdWMG/Y+Q8yTfnBNj
         kN1q96vUSIVLme12EZHUKXCXnoV+SAj3XB+NzLfpycwdTmrSGBhZWf6MueVX5IKPY3Hn
         wvxM/h6xg8QhUKyscANczAlbumwxdMuSikyPxuxqEAVTOyYADoUp+6kWjxZRxWUKl4Z/
         K6Nw==
X-Gm-Message-State: AOJu0Yy7tj3gm6uJoRi9cmq7cF2T2OyUH+WaEfwf/iaGoteOWDAFPnU4
	9l31A+X557zcQ1PzPuPM3EWm71EkdZWcv4a/n5YGDvUlFsMiED9/5b52KhZmsf0=
X-Gm-Gg: ASbGncuAQyFoxNGq1lLN1kpV8phIiaEX/vO4bm6GpRf0LXcqaOx9RscsfxEwvdukOBX
	ZMy1t47vqWeBFCbFXH2+Hh8B7TDKQFYB0tgL7IFZSv0Ya3ptnOmOCOb7P/mw/Ug1SxRiUxWNuZw
	VPknke1QzoPMBWi601lbfLvYDNSWGti3d7LAkFN3tW8K96fSzhPFCLvO0bc5I/IXcBV12NGKT+O
	V0HcC4NDo2u5gi9uAvbgu/XsjABDepypyT4ryT/uMUNvjU3LtNRAW8vlathj8iAtUqXDcHt
X-Google-Smtp-Source: AGHT+IFLu0UIaf+5jx37DEy4lxZwwV3M05mSfMw9AoLLPK7hRjpKmgmCd2hrQcOQ7+pDX6O0Azjp6Q==
X-Received: by 2002:a05:600c:3c8f:b0:434:f7f0:189c with SMTP id 5b1f17b1804b1-436e27007e9mr60748855e9.7.1736620985183;
        Sat, 11 Jan 2025 10:43:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] remoteproc: Simplify few things: omap, keystone, st
Date: Sat, 11 Jan 2025 19:42:48 +0100
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKi7gmcC/x2NywrCQAwAf6XkbGBTHxV/RTysm7QN6O6SSKmU/
 ruLx2FgZgMXU3G4dRuYLOpacgM6dJDmmCdB5cbQh/4ciAifJ/Svp5KxNs8vwWiTo8m7fKRaSRg
 uPMbrcGRigtapJqOu/8f9se8/05wxbXMAAAA=
X-Change-ID: 20250111-b4-syscon-phandle-args-remoteproc-06dfa873d1d1
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JoDXg2TSUGEGvFT9+KqrusBFwUg9j2HcgkAj/LYtsMc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruuI96JbnRYgzZ4zm1YXDK8H8sNWE4zKY46w
 pr8nJP02hmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7rgAKCRDBN2bmhouD
 1wpQD/9pofCs/15om5H48dOaM1MMSLszR4m09lUBklv+2amGCMoeSUx8DjYdloIkGQ/PlUy5obO
 7e5yqTcK1zE9JcBGXgWFERTIbGjL7PBgxcfCaGXYwbaN8LA1NsNBD8j3OdPsmW9zX/p/+D/w6gj
 N1iSKtj5TPsOEGNoqxwbvQ7Jtin/682tVXo/KNmNLYPNYgn425RhO1HX8g2kwZLBgUSTMqOE0vU
 NlKApfgl0QhJdCCFvxY1fo+vjZpcMzK3+Lroi9UBwQdFeOpftxrbnvG9BmgHId2IJxsJq9fp05D
 jqCkewJy1JweOAWbcm/H+PU61QpRnadbR0SVRl8e0jqpmq7VAkYVlXTUmVZE65mw+s+/MMZd1tH
 lx3y2KWO8qkea1F6kJfauPiepUu5eL6va/VMkPq54SAlJuCDv5ZfAmIAi10WX6ZNAN8lDZyyGMy
 WLgmiwKTmT6C+3WbCHXtUAAZacfrM5dBher5bvPUGFZ9aVadUo2vXIiA74HR9FgGtBH131dTBM1
 DyRogzzYn9kru1xyxlyeus5MpLT1UI7RgQXESkDlLoZcdWmHKtHVcNTaqFQ5Zl5/Mh1tbzIldmM
 sXQdxXrzYviwuk24roO8plGvjd6haijQxPsgNbqL+AdR23YuWLXrXfplpLpUdm1wE2qFk2iB9oz
 mLl6pP1GwKRWE1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: keystone: Simplify returning syscon PTR_ERR
      remoteproc: omap: Simplify returning syscon PTR_ERR
      remoteproc: st: Simplify with dev_err_probe
      remoteproc: keystone: Use syscon_regmap_lookup_by_phandle_args
      remoteproc: st: Use syscon_regmap_lookup_by_phandle_args

 drivers/remoteproc/keystone_remoteproc.c | 17 +++-------
 drivers/remoteproc/omap_remoteproc.c     |  7 ++---
 drivers/remoteproc/st_remoteproc.c       | 54 +++++++++++++-------------------
 3 files changed, 28 insertions(+), 50 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250111-b4-syscon-phandle-args-remoteproc-06dfa873d1d1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

