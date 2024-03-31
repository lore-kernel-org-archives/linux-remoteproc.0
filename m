Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2414830D
	for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711919447; cv=none; b=YlGFo7GFOpk+Hh426yWpUue53F/pNDEBe+Q1ApanrTwTePzfOhTU8WrAW2xbb92uW92gcQHbZBA2TJLr/eStnpKVih4WomX1m3wbLqErSZHaJb04o42W8QDF9oaE/qESIoXfxoZpzyJbbktAmDIu2jMvNfie1XBVUL7iswMoGDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711919447; c=relaxed/simple;
	bh=/bUJ2vZiRJ1BUQBh6+bQarLWjKMSmzFMhLsh609vsNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=guelbaHq2jO4xf8fnA96iKTLyvQ8bQkzScykMsQO1dtw6CoywsFATNMyzL2PS19ml8pCpfHONhP3TOUxfTYY/rq1uaFYiZlSW7DJ+6CGXa0iGEJlmx69m8NBjYckYpwR3rOe9VGvaeEzEJ62nZ8ILHpnUUBjpcRwTD5MB9YEs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F85BJ1JD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F85BJ1JD"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-515c198e835so3871493e87.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 14:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711919443; x=1712524243; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDNTwOGu14ahbhHwBh83VA/OwiG9cy/4b9joLOffRjU=;
        b=F85BJ1JDnCe9dt3GJVRB+UMciptU4X8GYmjO9EltmXi7nOqT406ibkZ014SzxyyVXi
         orcTQ4SNOyNiF0kHocNtuPegp+A6a8PO0tRfIo/8yDS2OfvM3PKS3PQBML2lk42M+aht
         PMq6AbdGHhW5fEFN4Y9y7gzDzMEZ/PP7pLp2H5HtHHOsSJVROTAHtJBoYHeOiUMF0laD
         oazWzf42/0QpJShF3lRMQ0BSrWPzDuwAxgXN47YYyBgZoGa8fJOl3M/NMxSARfG++dTh
         NbAwJXSeBQaG7FWVY/YHldROamYLjNZHOUK7W735LsG3MoUPttcsNOxGGyRKd00DodsV
         O0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711919443; x=1712524243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDNTwOGu14ahbhHwBh83VA/OwiG9cy/4b9joLOffRjU=;
        b=CZYInZQQbRIyZCFntDvwUYXzSU5mBnOCnEkfIFLtwmD2CWPgETJlJQJit8aoegbN27
         RRYP+zkO13SmEiST9mDrXJRLDuRUQ9fERnhBvqwwbZOh3D6/BVhrFFUBl+YN48+zjopB
         +8WJ6Vm0Tl0GbVVLFbGsAjyGqhexS+CK14AP1msG2i9VpnW1Z5AXKMz3O6dBySB0OXZC
         jAk1lfgxcvGQzltEV+k9twxhvGtP37P/3sd+HP6lsaETWOq6zHmaM4d+jz1Y9uqGuMDe
         5iFM5gUVxUMbO+OOwWcSQH29zrWpsklM2PkBnfAeIGrExG87OIsE5fd9/hAYyUn40iSB
         tOZw==
X-Forwarded-Encrypted: i=1; AJvYcCVdMUBDINoEo8WbQ2PjVFZEB9akWvNRr3zu21xNgoMcd0tAbWTiZWnq/ZE7di/uUrXJy/4ENBj/TWc7m7wMdTT/WJ+odzBA2cDz5ozudBjt5Q==
X-Gm-Message-State: AOJu0Yx0yTW1qJGzTfGkkEIqOz/Ulu1qJwAquqFSjSE4fp6ShGVOL7fl
	BCb/qDULJ2IxiKdPLrBTGYPlPDi9gAmMMAeR4daosI28/Z0NpeqoFnqSmdDb0Rw=
X-Google-Smtp-Source: AGHT+IEPx+7koAEy9piLri51NuxAiKN7NMUIFB2su1AyCZ/FuZ4h+3UN9IFj/2mN2a/LzgwynuFmrA==
X-Received: by 2002:ac2:5fb1:0:b0:516:a010:f1c0 with SMTP id s17-20020ac25fb1000000b00516a010f1c0mr2165696lfe.63.1711919443389;
        Sun, 31 Mar 2024 14:10:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i1-20020a0565123e0100b00515cd1d5c99sm1033553lfv.85.2024.03.31.14.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 14:10:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: msm8996: enable fastrpc and
 glink-edge
Date: Mon, 01 Apr 2024 00:10:41 +0300
Message-Id: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHRCWYC/x3MPQqAMAxA4atIZgu1/mC9ijjUGDVDW0lFBPHuF
 sdveO+BRMKUYCgeELo4cQwZVVkA7i5spHjJBqNNo2ujlU++t7ZTQj6edEhEtSLOaOa2IVdBDg+
 hle9/Ok7v+wH2Yff9ZAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=779;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/bUJ2vZiRJ1BUQBh6+bQarLWjKMSmzFMhLsh609vsNk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCdFSLc0+lMGfK8fGM2T9IMHyyu/gOaHRVLGHr
 mYLirWJ0XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnRUgAKCRCLPIo+Aiko
 1XREB/90yxp/NoMGbtzkgCoNM8Jvkvhdv4iQ2ofeKDbxSei5H5zZFM7ZeTbxLse4RM0BiLJULCt
 zFVN993xR9iK6OY7gG6mG4X44gm0LoFjlCo3kWmwplPvdCdX608m6UK3fPRV/m/Ilc00NGWYPY9
 pnqzqELlZpp5om6oEDG8byMhlQcAdC170S1UTWoBl2BKUYbO6FAuxtznyNNdwbenGw7H3KZwRvS
 7nxiIMfCBVC14oxwHInafk8++IQrKmfHo7B4/eApejvJ5KO9twtdMdy7z3dWw6Gyp6JVtxMNKli
 uHyRzrfugeXZ1nC16KyhFGeqBsgBF4/C3X+IC8JRq6a5XgwU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the FastRPC and glink-edge nodes on MSM8996 platform. Tested on
APQ8096 Dragonboard820c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      dt-bindings: remoteproc: qcom,msm8996-mss-pil: allow glink-edge on msm8996
      arm64: dts: qcom: msm8996: add glink-edge nodes

Srinivas Kandagatla (1):
      arm64: dts: msm8996: add fastrpc nodes

 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |  1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 79 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240320-msm8996-remoteproc-fccbc2b54ea1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

