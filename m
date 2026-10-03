Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851D64A1DF1
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 Oct 2026 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050234; cv=none; b=ma2p0bfPHKSCdMAvDP+JBSq0wnni2jUY5zQCn12Yl03pNpH/L/ERqUR83RWLeevh/Se0YUxT5n+6rF2MBOC8+1dotuzqj+NxdsFk1US4QXlAzQjqh70jdbUmc1ER+CzU8w6ggSjwv7x9JVZDzWI43JlINg0Dx3TtFnx3c1r1RA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050234; c=relaxed/simple;
	bh=8yWgSoYjBSNdU6Nh98oDiJF/XZdbU2DxciSxWFyxDpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Df+Qb41B723f7YotNlW3435bId0UWLpxUk1SyPvx+UO7Tsn1fLVq1ozMuDb6t/7Gt/XadplVouMUL4ibilA39y4VidmpwIBlMkNjWTQmZrFpH8LdGcCFxVGQBRlZCqqFXFtlwhUHW60+akMo/kvjHhxhs38pTsQRn3uaau1/Z3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwBdYDLM; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwBdYDLM"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so10587896d6.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 03 Oct 2026 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050231; x=1791655031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Em/JfgIRn8QRBLzYv+qkJFEh3n3+7GlE5/RkiH73XY=;
        b=pwBdYDLMWebcK6aQIGu389+dCMLnRWx9Pofb1Iv4kYQKejHBzsG2bwHw523N8+4kSC
         GXaTUHoH8ZznN3alstOAi90QMJSXCXyeKApnUq/PtdTDHj1HeJXyTA/t9Uv/ZoQAb1QB
         3YLMIuPOS7l9KWeW9Muv7ZS6J8X2yNqJRFWeI4rHjfrY4EvXeVPhGwyok72jvC7zXEvk
         Go5VRKxei5RTUdcatBk7vldylc2od55pOb6zMbMMrdnrdgC3lLjFfyPWjN7rYyUxhMfv
         ljoJXmVfFif7dW5tVnB1E4zDKhdnHX6Yqwua2+U5zEZqmJDSayq3mXK7du3B3OnoMf1Z
         MbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050231; x=1791655031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Em/JfgIRn8QRBLzYv+qkJFEh3n3+7GlE5/RkiH73XY=;
        b=f+rMNKPRzR/Ri8ZzN0qKE6+Vkam4iJym5fv2u4Y21sWqiHf/0DYxbq5M+mjK3Oq2Xb
         FqI4Xdq8lSGYUJKDTjlj2xbdHQPcUc1IhR2bu7y9GCdfJGezTY+R/i5e3GqCAYqjgxuu
         V1jdINtU/zMnrmGFO4usZ/nXNStpaURUB/4/6trqnG/dIRXKxpOqj9yQd+sJLnV0gRb6
         EZ7ZF7hXalTF4u3u1K5UqQG7SlimJrhXDo5wJlVlr27LSRQJ3N02fpuojW9llWZzFi3V
         vb5noSvBEZhsOHzWFEEAT0xOJ+yryOhkVpCl2cScbyNEGevTI3T2n88AMNcPAFfxYy7t
         GypA==
X-Forwarded-Encrypted: i=1; AKwUvBzwRQXohXTPAaSXbFmHf9VgeSWjKJwm/GoJvOpYx7ZYVMCFrDd3ZOAlCYNZius5J8VWoHjlBlb4EMTKFq88YDHx@vger.kernel.org
X-Gm-Message-State: AFq9FYI9MNqTTzXBZscG3LmHrKnlw104nyclACUouUydSJEBcXVids52
	VRS2CzFO6A35yOPhpPq0JXRk4CIx/1lk9iDbT0fChF7gm8n+8sLzzlmY
X-Gm-Gg: AYBFou0q6HvmkK7EhNLtOBW2hn95tcW/xNMB1CNg+DZNp4mNlx8kvietZgbyE+yN4ue
	Y4t+yIdwiVKvfRgyE3DnZ7rtvSInrQ7wHcPcrB5suXxoSLhsZ0ins1vunNMpdGasq+AckDw1pye
	OYbj7LFI6IhcDqMUyL7Qc71JKaWdrS4843ogzoCBJdtpAn3qTrE5iKPQ+7/6N1vc5MqnJbEzeGR
	e/yKyvsuqJo8OKyGs0xUv4gZ+8TBGg+kIKntJ/ennE5GeHkLp3avyuLCp4mrM21PPTW3okwsYcB
	rNGV9zT8YoQa3UxLHO8Cc/u4Ut7zgK5bTaYAAxh9l/yHAT+vgEDR85hLCz12PBdMpZUfaV8NIad
	ZhNp74RTDO/PF1c6FTZ8UCuj/xxhuEmzgLheL677AxtILrvcgznkQWFFN6LeXydwb0BXwKtiZy7
	ZOu/MBaokEpoOGlWN8FEUiD+mMq6ebcP9GnINC3Jjz0wc15jHNvQ8+DfMtZkUCuOPeUx7JoVPqS
	Q==
X-Received: by 2002:a05:6214:1c0b:b0:912:340a:1dea with SMTP id 6a1803df08f44-917bff2b122mr122876166d6.1.1791050231430;
        Sat, 03 Oct 2026 10:57:11 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b691dasm49017826d6.23.2026.10.03.10.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:10 -0700 (PDT)
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
Subject: [PATCH v2 05/11] ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible
Date: Sat,  3 Oct 2026 13:56:53 -0400
Message-ID: <20261003175659.23536-6-mailingradian@gmail.com>
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

The MSM8916 digital codec is also found on SDM670, typically connected
to the sound card. Add the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index 33bc23b6176a..b603bb6eb9b7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,sdm660-wcd-digital-codec
+              - qcom,sdm670-wcd-digital-codec
           - const: qcom,msm8916-wcd-digital-codec
 
       - const: qcom,msm8916-wcd-digital-codec
-- 
2.56.0

