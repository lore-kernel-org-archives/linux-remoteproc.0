Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iVSDUnwg"
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DC319AC
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Dec 2023 07:09:19 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1f0616a15bso213372366b.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Dec 2023 07:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048157; x=1702652957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5saW7f08DRNg60nP1egaBbrtQdtUawHIZ006YWZ+vGo=;
        b=iVSDUnwgi00pXXu/e7hHEpen3vn61cDhuVfiXrcTc9yDwHTDzhNMaSnQHXCRn7nSnT
         5yahXJP3yTplAMjDrhvx1HWf+iIl841nHgZekgaXvy1r6ynMAEzU127A07AcKIB/zRg3
         zCA4sNdz3EuDO9URtJYzvqzmzBX31S6qY5B9VEhYBSWbE/aQxquY23PQyyhGqbN6Akzi
         QXvyQhGfOZn9V+fEEu+dcaMHNzVbjQ22C70slcyqVX96gmaVRvrAUxEhdQrldpsfeanf
         bJWdOy690YtuH8CVuIgz3XdSqFTySK7CeddqfJISNfksvm4yLoaeJ26W/xoGOb7zwNO4
         fYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048157; x=1702652957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5saW7f08DRNg60nP1egaBbrtQdtUawHIZ006YWZ+vGo=;
        b=DWPF24fL7IDUX65CLK9vlhe9XDF278OdhR1q1wEcwaUkt+XhPki4cqQveUsevnOgBP
         +CqbrpMM0ftRKfTpI5szZkNffNgOd2J2fr8g2J7vTRcG8Hctqx+QI8xd+bag6hCzTihK
         gtrOz2sL0XaSAsr/E1pcUm4TZjcBzuz5kySIcHbpKef23Tt/b0GZJ9SMgYR5SaSbMIjl
         BTbYlGtZL6hINEvK6KSO+i4n4tsWV+sB8l2RMYx7QF9rlmbZkK4eQYCGXVnWPPW3bHS7
         o2/d/JvxNxMX4DmJQ0CSfJZfHDJA6REesxMlDNjMrRf5Qh8bX5F26EZAoWuwHcMbF6qe
         AbUw==
X-Gm-Message-State: AOJu0Yx9XzwVYEEXPLWwSbBufrNnCNGUuFL1MySZmqXmYdff9EOsRQIT
	+++DVVIbNZTtjqLhTOi5lB/lYsbkP4308nAcqoBQug==
X-Google-Smtp-Source: AGHT+IEd51m0JuEJzkDN/9QlvvgYBDbrDZhxRc+YXzhVBNr7lRFtZjwsx9lkYs0+gZHZb4zXuUHSdg==
X-Received: by 2002:a17:906:10c7:b0:a1d:2e32:d284 with SMTP id v7-20020a17090610c700b00a1d2e32d284mr60291ejv.23.1702048157297;
        Fri, 08 Dec 2023 07:09:17 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:09:17 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:08:07 +0100
Subject: [PATCH v3 11/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 WiFi
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-11-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Now that the WPSS remoteproc is enabled, enable wifi so we can use it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Depends on (just to resolve merge conflicts, could also rebase without
that):
https://lore.kernel.org/linux-arm-msm/20231201-sc7280-venus-pas-v3-3-bc132dc5fc30@fairphone.com/
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 830dee4f2a37..03ec0115b424 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -914,3 +914,8 @@ &venus {
 	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
 	status = "okay";
 };
+
+&wifi {
+	qcom,ath11k-calibration-variant = "Fairphone_5";
+	status = "okay";
+};

-- 
2.43.0

