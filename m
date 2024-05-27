Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281513AD09
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799460; cv=none; b=lOWWxBbnI54m2KwpNZJTYEBGd7BwbNmUi8MPIUaMIcv404bD0VI+1YVbgvBRVTvBtt8K1HtyFN8rHRaHF2VG2SsPGrCY4xl1lHKKm9gmSmqtSP8FHeAbWzuswNQKX3jz46S6YOW7ecx4jHRszfuw/N8xSIMAOIt0+CaBHU8CxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799460; c=relaxed/simple;
	bh=3EDAUHsXKoG/qKpImUuoYQAk+6P6yudy3+ZtIt3JzhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SANmWelP2W37/mmVvPznaige95Fji8/McVjsruFdkf68iXLE7qiihDG+o/qw8kipj8wDDRTSazuUzuVo1We3vmdMSJ3jwXutpCbXoe/F5QBQG2IZkcHDMoPdD6i3Z7yrtsgXDy2lQoef8KcqSiNp26tDmv147lsuCTHSp/IgreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YJ5Dls2K; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YJ5Dls2K"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52965199234so3262902e87.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716799457; x=1717404257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ee+lz1uwo7ctAXz2XE2Pj87WD7POTM2aqHSnKbmZAtQ=;
        b=YJ5Dls2KnR3/FHfrY/be1/4+7pyhCkIeysY3a77VIjKey+CIJkQaYCjNwZzZTlDCSH
         uRhmMEdJdKtFYIiCK3cKzSgPEcFehvnsblpnrgaRWtRq4UgY4ncLC0LXXxh0/Wx3Dtu9
         s8CdZmHot99sqK/y4ePvWO85GbS1Akr7p6seqtecKHgWP1v44Wv3SsH24PQLExwe1PgC
         Iho2yOlF2GUoQWYcK7a7sTB9mCemEoskyYvuX6Cwe7pGatJ/3++mZdYRFQuaUMdscaoy
         mSd15lEM+Qy7GypkTws5Z2iZEU8lBg7vIQOvfBbk6R/Ry0Em3XCDedKafJD6uqNFQkv2
         5m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799457; x=1717404257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee+lz1uwo7ctAXz2XE2Pj87WD7POTM2aqHSnKbmZAtQ=;
        b=cwlCnToHOPqw21n0imW4aD5IAhuFYFTYppC9UyQY4h2iPw4FVHzuuVcmd5POykRzqO
         dj30ptwa/8TYdbPhXBxkbqrWLfMbBV0qeNgzyGXXojbyLIhEzXL3BWG2JYKleplwMbds
         4plNowCMKC0cQsPcM5wT80/0+NLkraedJAqZgML4iGhswiuuBjev8bEIck8VZ5IlKOq6
         w61WI5fREcnvSa/ARRB9edpm+fXIgkAXeISfP6/ae2u7BSIfa82NUF3GuNbSfQnMnjdV
         NEbup7Ahzd76Pmk4kfHoVIR5E/QnaEshMmbBxmEMID2AXa4Y087gNLN75N1gnDwsyMnI
         gBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa8Ns3QgDAhZx/Cg/2ett6GwcolLdGnKQgp35avLx50oYk1bPMsTHV/2lBzq1/HhRC9Se2QgR4tsEpUdfEjN8v8lQOEKNC+O6f+B6/jUMaYA==
X-Gm-Message-State: AOJu0YzgLVvAv4Ua1J3E/M6fqcsZiffHFZyzS8e980O/i9HVktiu8S9p
	yiAj+lx1DxpRsTPEa4sZsGt0KTbCs+doXX+j5FO563jGdknzNMhACKfRI6ie8+Q=
X-Google-Smtp-Source: AGHT+IHgNGBH0VfGcIy+2nfmBInkHcxkSMBQ3b9/ZSu+UgtuVTHHwuFH5qRtuL2AKhsJQ2UiDs7DyQ==
X-Received: by 2002:a05:6512:328e:b0:51c:5171:bbed with SMTP id 2adb3069b0e04-529649c5d97mr5449550e87.15.1716799456936;
        Mon, 27 May 2024 01:44:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108966682sm101365575e9.2.2024.05.27.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:44:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 10:43:52 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-lemans-iot-remoteproc-v2-5-8d24e3409daf@linaro.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Alex Elder <elder@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ltuWgnMWBVzAFPrqL4rpwFznsQIrPKuJMFtG5UNQsAY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVEfZe/GoJRntgWCYkwxLrWLqW+XWv1z2ooQwe
 6xSFV9LCNGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlRH2QAKCRARpy6gFHHX
 csvFD/9V8wQHO7eGFPD5rqaV4OMF82bXwBTAmtVVnC/vZuILo+aKn7VhAyYD/PrKHGnj/yfyIFS
 6hqBLaRJt3Kl6RAncH7CjxN+ROoJoZ7urrM1Egj98o697IidhPQyTcNgFNJdhNKnNu9TKFihyNF
 iwTej7Ux0TBrSyteCqt3SQ5ZwMYYlJoSqPk1xPM792Omh4twuYfyaLZaKoKRievmXvuCK23eTN3
 FPRntZSMvibTwohL1rs2P/hJwtLaEIXK9Z8+KiSg1LruzHt1tZInEqNCfDZS3ur5KuBXEXSyFL9
 OKAyR4pPvRnW0x9mfD2vWUE2CNJdTKK3Ns5bQfIErkt68wfNS2pU0amYDaZkpcKnrIDigex86nb
 6E6uRLFqc5lFdQjkwOa9zM8s5OLI5aRUooUYpJDcel5Y19/VLEx86vygmKfzYjtFcgqhzjNnXks
 7MG2BNwtiNBx2OfhI5DkpWPHFwvRT2Eo5wwRii36wnemTNeJw2QfZyTOER9Yd46W0J/KXMlDLBa
 4mVoD538ANbF0ifNhlUhxsCGr6LLZ09/yTKaLFveMRgyMC+QSIxXTuFXjT12WoL2U0vqDAX+Pe/
 cP6YtqYH1rczE0KiMMk2gDEdlW6xYZkEaMEQ9NJHWS03wXT8yNmVoiQELnOSqUwDuApSyOjUfyB
 YojYZSuQAGCNwQg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable all remoteproc nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..071fcaf09364 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -727,6 +727,31 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+	status = "okay";
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

-- 
2.43.0

