Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29A49E142
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 Oct 2026 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050228; cv=none; b=G2HX6oP6752FJ91VENNgYayefrjycX6h1GJM0hqnjPlOzLIY2jYz5KU+1DBlkseuWWUoDBBI+i0EKqLmBhtsTYbXtMg2xNAIpFoHVX94QM7Vd0Pl17IswEJ/9m3jTd2drg7ZuP7v+ALZAau3vG1gkMHbsR7deI+ORpcFotxeS4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050228; c=relaxed/simple;
	bh=szPuGGTtfUj84/35ZxpkmuH0DFT+TU6Kk8qqWgkV31w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5kMMMZO2ZFk7GeynBprc6vHYQNf+5P2alcBh3VayWyNs1iUdFbYUsfdWb8RUwDdOnnTVz1UKzMIyv8JClKUMgEwHlkQOO6IKa5+edLOh3B2hHtvLSh1SpuVpDpPwr1oFpxRji6y1fMQjyt6vF/l5u7G08LU1nLecw2R4gjbCj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McQ5dTlF; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McQ5dTlF"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-5337ac9e465so7694091cf.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 03 Oct 2026 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050226; x=1791655026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfFIZHmAXUfUmZxw3uiwbv0WXisyRuRAzyViuEdezC8=;
        b=McQ5dTlF/jo7QBq369fX4mVlvuzNdQmwhcNH375qu5Qz196zGNfMBvYNVJ9KSFnfWW
         n1TzjupnRUu4lxb4gQqigEVR/9DHM6HJMkR0ogU+EX31kw1IS98LLOOqSPSkcww44SHB
         lg6OiuIpB+QX/zxumUGrTwSjcSCCcx0Z6hpRGtlQYo3kQE132A03T4hDZNKJ9eP37q/o
         FViVfwVVUVJeb58JKtlqyFZ0w+tqA584mlRkjB5c7NFL7FRNjnkakHmsZ49LEFgoBoa6
         Slu6uJAv+xBiL4hlFcW+hBjFIJ31rApUnpA2Pvn/IvG0gGIm5A6uOJdKWwkb0hcTcBU4
         0XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050226; x=1791655026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfFIZHmAXUfUmZxw3uiwbv0WXisyRuRAzyViuEdezC8=;
        b=fm6P4ToxHc3gvWaELIYSHp/xapsUcgIjAxstrh4K/IG12FxEDrOELb4ojuYHzr6R6E
         mSHhOYkqxDPvZXL/G5YMoWAoP5ik4UcN5/LvzokUDje0GzQupp0xnltlVt89RkZLI7km
         Y8K6Zzm8CTmdX8zr0tQ1boCSiADVU9gHe4T61yq86wb/rMVryXMh5zAeRQks7ZxYAPqT
         cyJx5OocImH4WcXE/4lYwx93/fT9BGaWayTtOrWxvW+SoOLEaylp6oW+2XieCwol+xgr
         WEJDfsr+z7arEjFXOmjovL60TlcnPqPTOTATtyOLdiHcGd40yPFu3fBmIQx7xjo4zLec
         /cfA==
X-Forwarded-Encrypted: i=1; AKwUvByWUCXI48AlXnPdgbMwmIo+umH13qCl4fR5HvL8bZdT96RAvQ+6KABdA1dnQg1TOadpkdKKhLLl1aiTag93Xxo3@vger.kernel.org
X-Gm-Message-State: AFuF++l9UU76PHSZG3a59/QSghZ7muF+wgHoqOnvI74TB7Xwew7Tndxl
	3isMD8ZBG4wZBIbUq0DLHTOzB9xvcPWgHwsVEy98DYzITi/JDppvTnlu
X-Gm-Gg: AYBFou0OChm9MuqxxmglJxsTwetpLAxQHeomHHat54R5s19/nyjUPVc18UH0Lbm/Wvb
	BrIOj2BhRqxOJT5rKtl1ednVdvmWCMsjoH7Pr8yY6vncar1WBRad2QzXwW5eJveNFqNbgwx6t1L
	gWnVsnneYyyxNr90u2ySROemxpplFs7E5EpS02hlBVHwdHn1zOvEsrtotnTNvPd4+75G8+jSYz/
	P2vAUrTRBQfMxQQH5+AzkG9/j48MOUInvK93EhgteJ7ja+eTueOcKiRs7YzsVZqklHbeggksHnl
	FkMye4CslhhflJeiFAXwqkGemrUX5QqbP0VDLBiLYbAKUAjHvFRPjGbU9Y6s5hmRfXFKrJObABK
	z4YOxK+uboBHPfj0mDvzYue5bIs50l0wCC5c8ju2ZPboBjW9Nk8A8UgWQ9dQjxGFgxw7Xka5kDg
	dfyU9NfXqFjoez+UyD/xu9kAvgZkkld6yMrbjaf0KiCBtas7GK0hqoANlC4egumVqoKcGqGvgVf
	cM=
X-Received: by 2002:a05:622a:4016:b0:535:15a9:2516 with SMTP id d75a77b69052e-53515a929f7mr42274571cf.53.1791050225789;
        Sat, 03 Oct 2026 10:57:05 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b685basm49294306d6.22.2026.10.03.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:05 -0700 (PDT)
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
Subject: [PATCH v2 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
Date: Sat,  3 Oct 2026 13:56:50 -0400
Message-ID: <20261003175659.23536-3-mailingradian@gmail.com>
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

Add the compatible for the APCS in the SDM670 SoC.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..74f24e07abc3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,sdm670-apss-shared
               - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
-- 
2.56.0

