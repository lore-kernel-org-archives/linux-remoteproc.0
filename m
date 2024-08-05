Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1D615ECC6
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Aug 2024 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877699; cv=none; b=pzOGMX5VKSY54qZ8VfFAntl0ufddm+69Yk2ivj8MVI1Qa1nswO28aJ4hxuxniFXuqpttmGlQnIHqNcEUPJv0i1KPEjQeeI4x/z8iBIMHe8kCeMMb/4J5x2bIrrd6gXZHlrKIYELzQTF1PBxYCpDqP3N71tXbn8Rv/sNm+wZK+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877699; c=relaxed/simple;
	bh=MS2pg1hkUFBkA3HoD5bx+WBJu4p2mdrw8oSNHZTARog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRVa6GQrYKKGVB9mtdoY8m5l/CeyCdTmIOGYrFgrK5xaCheVBoDyOm+yc/a9XlZTNpR+mi38BlQGXHB5wgZ1IwIlmOFI9DhIpL1FgNkj+iyk7Qa/gvJW79B1o2ZKdRqYDNr7Z42blUbEWhswgtix8cIo+vxeKMbKb4M8XrREvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B27O5reQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B27O5reQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so69567745e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Aug 2024 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877697; x=1723482497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf/ayE1GI1WAlEGzaVo6/9gInOblIFTdfpLa3Fxp3ZE=;
        b=B27O5reQz47GEcmSPgKpWgWbMpafuGcbLg1kDZwerDGUddqh6D/FmcFjuKiSqukSzl
         MHbCgJvg6BZ03x8IHce2DelKCwzl0TZt62SZG6KOwbup3vkp3YB4SWECqMROXZhMstAB
         Y0DBCHNp53lgj1W6Mr7+e3zzoDOpU6Qf21centQrR7WBaFQtBpvVGFQYL0vjA88JUuW6
         7OCDF5ZeeVQfDLQ1qNDfs8j+GAE5pz22kc0JaN5DFVRZfHHmXKk2bqJ0cU4T575/AAVg
         FCfBzITizONfzIXKvWhtA6PrHEKCfJev9h6Gm2nmeolRZ2UgvS0TTYKBfS4zpj2BZ6hU
         jv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722877697; x=1723482497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf/ayE1GI1WAlEGzaVo6/9gInOblIFTdfpLa3Fxp3ZE=;
        b=kSZlUUoO8nzu0++Gy3J0576Tl/jWj7anIqz7F0fQKC8rgqUkybVqrroXTLb+Zd1MhC
         ZkjRixDr3gLPMsl6+PTL90RikaSUABwZyRcbHuWZLfHJzwUaZH3AuGMrH8Kq0hoypx/Y
         ER1rAxqtBBo5Olw0pKgOow0ZD0Lr+hTERQmlNAZQLXIdXt9s79w5gAhF2gluylpgceQm
         xCjk4GUKlYZXHniY1nxJeD6skrEOJ5on2mXvS7UpNL6ZG5J1C1FAim59ep9OPrL3S4Jk
         k3AgtdO9kYaxlIm02crqFZyj7vSVQbAFWJxCpks6b+e95yGU2nfYZuvfcopnwt4Wo+r5
         YhIw==
X-Forwarded-Encrypted: i=1; AJvYcCWLZPYMI3MvKgWc6ZRQ96xAgqcswwB2+I7SVKS6Ha2KdPi+5h8N7uDW/Q8oHivqJvK5J8uqmcQfd4iqYZOj3t1rjsAjWS4O3cRKkAVlpxrFCw==
X-Gm-Message-State: AOJu0Yxxe8Ej1GzGP3Lf63LYBaH5tceukrVBAvLM4dTf45O0Ar/crhKB
	fSf90G8jfmRlJD8284KjX2MoegPiULzcKoQIsBAgAA8/2MBXHO400pyWPHDtcB4=
X-Google-Smtp-Source: AGHT+IG/VsX2YjO90PsbOVyyp86j0OkVdlv20HcJ5UEbUuIJDQujSBOyOBKHUwibMHyf3uCMfqjpvA==
X-Received: by 2002:adf:ec92:0:b0:367:4e05:bb7b with SMTP id ffacd0b85a97d-36bbc17dd68mr7198288f8f.53.1722877696419;
        Mon, 05 Aug 2024 10:08:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:08:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:03 +0200
Subject: [PATCH v4 2/6] dt-bindings: mailbox: qcom-ipcc: Add GPDSP0 and
 GPDSP1 clients
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-2-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3xzA+6EtS2RZb51APTtA6l7MBhz4r0SiIFow/JPj6bg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb78RUhtBLOHSNtfOqhMB8K5PTHFwg5KQVqu
 FDQvBOBZgyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG+wAKCRARpy6gFHHX
 coutEACCP27ZPwka8RHk//l8LuvMTup9e3R2nfQSO/ysAqpfeNnh+T4W8USF35ZAgtTys3hRQZK
 MfEP7N0XCBxuXvHVm7wJ4mQLs1ssdn5/YWOv216/4AGJZwzvT+WvCxV4BIKYkxKqonjYzwjDzuO
 CfvSJpURdYu1Ir159CHSwI4pkWWvdg+QcXfYiQA7tuGtAI6Hz68bjEv8rlC2RWETLdV6AdbYWnA
 Spxz7wg092RVTt1SiJnxm0+3z33YVICsyUOBwyuzuh/9n0IIWO41rNk6G6Sc2LJ7GKGEnWeJXno
 312X5GnZ8i4yvQOQlbis30TEh3dbmzbgzymlFQ9ryS9l8WUlIDReSGWfIK2vbLSe/L9A7r6CaJX
 +7s2mjenHCP1+BdA/+mqlS9dKyZt1aV0AP3aj7jBB1GPOIxGXGci0UWz822O6AYhrkBCjnOo155
 ZtTRDTK4Igt2V1HhcErxIejoLaKBq8+AQuhuIkKyscjXnh4RL9eqBJdc6EO0fhvyHOWO4UHy1Mc
 ygiorG2/1wIT0kWTLkdAxH299MyiXbdoeQOnSf1GWh4UEmvcD1uTINBVWH/nmCaYPzs3RFLC1Pp
 C7qauf6MGmfxYW8P1PDuAj65DWKBgzNvf1wK4jCEyJCbE9Cfgo5cc5fGB3jJosUlpUg8lo0FMrA
 GBRDR2EEreqG4XA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add GPDSP0 and GPDSP1 clients for SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/dt-bindings/mailbox/qcom-ipcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index fbfa3febc66d..fd85a79381b3 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -33,5 +33,7 @@
 #define IPCC_CLIENT_NSP1		18
 #define IPCC_CLIENT_TME			23
 #define IPCC_CLIENT_WPSS		24
+#define IPCC_CLIENT_GPDSP0		31
+#define IPCC_CLIENT_GPDSP1		32
 
 #endif

-- 
2.43.0

