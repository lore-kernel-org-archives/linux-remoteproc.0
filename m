Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B591B49EC48
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 Oct 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050230; cv=none; b=n2tuDSNsQvo9US4w6xefbsifWQUFXrNEvc6CrG+7wIxbn1aZff38nXYs19/QzLtqUS1N9kAG0uopy0OiaaRKUruIA4/omZigBRmLVbPUtJOMlQq1b53xhMQHS4fiVDUepd8z1tkHsRHCTv3SsSWakcsIhRxabj12wO9meypBGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050230; c=relaxed/simple;
	bh=E3tyehOB9W9Nl5Yzv6CfUNAfqt/mgkcRmqeKsC2PjQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y46gYDRpkWjlpJMXBR92sVODCYxQxfBaav1qGoUDI9NS269iqLdaNeX3qUbSTWdOkgzAoVt4dGBkrI6ijk1jey3GUsr1tMZoeyN7VJqgIT7wwORemKV/Qxv8r4zQzAMOxykCqH8FMhlgWmUwUwJCj907A+aVa/5rECmLagHE91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEZGQzCT; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEZGQzCT"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e5f819884so14247185a.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 03 Oct 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050227; x=1791655027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=kEZGQzCTESpYFJNvGfSXIZ/wqWtxmC/VgLMeAN4s9F2TQIEacrwlkc1rxANW3aU7W7
         bcO5wEz74ImnfjtCOhlElEy9QDyATLOP0H4YR3cUSz1zaCx3nnEcT9WALApMfvE2XevM
         6Zqe3bX1ogA0ppM1s0FkpwT7R4KHoTN1zCSewGrtGBuPK/1OCl13zgus3brDiiY7Duct
         koNLDlmbk6idk2lGnXol8gIKuDxdbb9347pQx3KWowt3WmKtOUVhUCn5WHnIisp3z5th
         L9CTKhvliu4CF3FY8XFnDX+PNkWA/eQJ/I73RZgQ+u144RiVa150qjrtV8Sv1Tt0TZ1m
         q7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050227; x=1791655027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=J2oQzRj5Jo5e7HCr3G3+DAQo4iKojssV9RAg1vRU5GqI9+nbrImS2vU9Hfa1QQcdUi
         SWUQRR7YVqB7wozG6/hSjVYYeE8D/2UXhU88aIWDm44Tt+01XfW0WPoQl58JETbNsexg
         RBXGVnptY5pTFBVwuvpKP3wMIyHKV9ffQVa+12Zo5PmCKuBEm0upILWs1RCXZ5V/bBD/
         Z6n2gkJyVM9aDgYlS2Ne/x42P253CfO3FeirVdiOXJAknGdpVS8yZEC+xKcVdqY6XqGO
         Rr6W61hJThfU1FXxN8k7LR6989niAzHtdtqym7qMzBaA7SfGBnLwBVEGQZAeIysBQBsU
         ILLw==
X-Forwarded-Encrypted: i=1; AKwUvBw2yglzPjpL48rUe3TY3/HnMmnbZW3yFWIzr562K2nVxWf+E8zWPL+itddHDIixFYCXUhujIA7WF2Uszr1sl3VO@vger.kernel.org
X-Gm-Message-State: AFuF++kiISXBeOq96de52K1sDEthNnwbcrUAunzHFlcEPsK6Eu/h+ypp
	/FcqNrPMiw1Hvy8rdyT017T4QdWyzLjbdB98V1C/CTdaJx9LtocYbByM
X-Gm-Gg: AYBFou0nzCrDRgSZoC52peTs4KYirMeOQAeurOzULYOxa9xdsIpEVaEpGyZkS8Ljl+e
	k9YnTTSb9kt1y0CdiDO2NsTL6jCfWvvHe75cQ2OadOv2JibvtDm9Nfcai1Y1q/vtjBeboqaow9m
	CA7apxu+OWHni5iu/l+/qrjy0lTvymEA1ZqJrwrDYW/AJZuQ3zrwMN2tfHzQwziTIof5aPkVxiR
	WHvShXwx1hl4T/O+gAYx+fTbwWE91jvSx3PN8zVWOpUXTrkFmrO6hmlm22pXepHTOHr5r6xTJ41
	afo3y6eyrl96U7sIGv63FmECs/4+y17CHvTlFkxdEtiGbDq6DfwlSxbydzV9atUOHGP1PhTWB8v
	pWD9tNndC1GFYZuK3au1wNEwoEjliwvZ1q3Tc1nWW4azwf5yh+OzBGycOWEFB/Ozy/oSDEkojkF
	JlHCHR7wqVV8Ur1v4fpq8di+vTK4K+1R6F648vlvi/osMV+av5ztd9/jBUHAZOy/k79obKtbN7e
	Q==
X-Received: by 2002:a05:620a:28c6:b0:939:13a7:70f0 with SMTP id af79cd13be357-93e50e08351mr557059385a.5.1791050227622;
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e5b8c55sm283382485a.16.2026.10.03.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 03/11] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Sat,  3 Oct 2026 13:56:51 -0400
Message-ID: <20261003175659.23536-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index d2ae2ae87a95..6672f441c20a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.56.0

