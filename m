Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="21gumZTl"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FADB1FD6
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Dec 2023 07:09:16 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so248168966b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Dec 2023 07:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048154; x=1702652954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8hg75fxw9R+dBPdPORPMttaCUpNuozfVfSBn/F7kAo=;
        b=21gumZTlYpHHCyOvLr0xICTvdQASzRB644cNYztLQzfUSSqdgSIHTiG2DgPuVbiIYd
         Mzs9OHJva4WrAYyOrLhX5H3VKdHiSHBwtPWZHWIS61DTrJH3bny20bmnvJLMkeG4hG9p
         1EKIyznSwd8dsALeDm1WSosu/shbrLe8/RpiaJVGoPy/PLCq2stkR3gyY3PmkhDboU/o
         n54wcELF2T1j0P3w6fxZ/WnTx2a1/tcqK+Cxci28+rCKgc2+4tqeTwgyj6IPEsREvcgY
         zD3Y6jTWliGybLBU1DuoWeo9MePcbKSZrRGs7Ng4QyaQaQQXgZ0V2kZDr9zda2zDIZyi
         c9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048154; x=1702652954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8hg75fxw9R+dBPdPORPMttaCUpNuozfVfSBn/F7kAo=;
        b=l+0Jnuxk1+ftShUyfIaBE0zQWDtoKC/PyiLZzbLwMFFN30VoMYusK5p7ec6qUvYeCr
         Ba1CW0noIqO0D6reOsheoLzq60mwVK/gZWSTGQCQS9ZgclDBSbVkFLX3CA20wepEyinL
         EKyXxAaKpRwhZCrHgX3oaAlxy8/73ltoSUUBqLRK38Sa006ogX2NMrqSGY2ZYr9XL2/c
         1lp18blX8Bu/MeH4ZlM3HX0nM+5BA5EceDHZlPbILrRl46j4JOeaPlF3ySF2II+K7Ase
         wEGuuji5tN112Fk2tDmCtlDuHSbj/3xgSHgzeN98pDLA/2dOqaPNSLXe9TlSSvC82B25
         Yaxg==
X-Gm-Message-State: AOJu0Yx2BQYxQiT8YWIaxnMsfJa0S8NoylrouNX1RMFNvmO4E9uD23Y0
	Jp4rbfO7WI/GDZL+27I35ckt0DsyAVlOi7v6YLrSOA==
X-Google-Smtp-Source: AGHT+IHpNXHD7hMM4qjciCbNAZmxBp44HoDMbmCRqYLv3IH/ca5r9OaByDVmFwDOwqNYTv9DcdmjuQ==
X-Received: by 2002:a17:906:eecb:b0:a1d:ec18:6ada with SMTP id wu11-20020a170906eecb00b00a1dec186adamr86437ejb.104.1702048154429;
        Fri, 08 Dec 2023 07:09:14 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:09:13 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:08:06 +0100
Subject: [PATCH v3 10/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 various remoteprocs
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-10-6aa394d33edf@fairphone.com>
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

Enable the ADSP, CDSP, MPSS and WPSS that are found on the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 9c25e28a62d9..830dee4f2a37 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -691,6 +691,26 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/qcm6490/fairphone5/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcm6490/fairphone5/cdsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/qcm6490/fairphone5/modem.mbn";
+	status = "okay";
+};
+
+&remoteproc_wpss {
+	firmware-name = "qcom/qcm6490/fairphone5/wpss.mbn";
+	status = "okay";
+};
+
 &sdc2_clk {
 	drive-strength = <16>;
 	bias-disable;

-- 
2.43.0

