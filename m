Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB213E04A
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379739; cv=none; b=mlELG0cawO4uAI3DhWQrjHgcZiauU/EQ4i3+ZhBG8RjZePInFVFaKnUHPvehJQA2c2G7aH9wL8Zxsapt5Mt9eyf/9uJoRn1ObRQj80WAG3Ysnxnk1aKRBbqbZp1JP7kP9peJAmcrDgN8P2Jcd8rGyri9SKHBZXAkXtI0SfXwfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379739; c=relaxed/simple;
	bh=3EDAUHsXKoG/qKpImUuoYQAk+6P6yudy3+ZtIt3JzhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiWwn/nVIwN5m3QPt/sbCFk53qcSDwtR2yKEiixYZw/BFAlfMzZlGNhj+VROzQd22ZHPCoZAngLffisnIiNL75EU7WsCs3yW9I+bx+Zt/NJTZOK5CNI/Rfj5Z1QrW8jy4UDGb59vOGAEy6k6Xgu+Vg7gpiTjQFuBntR0vCcetbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S2UMlNhv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S2UMlNhv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-354b7d76c52so538616f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716379736; x=1716984536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ee+lz1uwo7ctAXz2XE2Pj87WD7POTM2aqHSnKbmZAtQ=;
        b=S2UMlNhvzSyh6Wm5wdRCB8+CFM53KE/vF9cIZHv1G0GZM+WZQhueylbO+8adV3gTWk
         XsygfVdXPSvbJygDkwIYmGZmLaMPvP0z8S2kKxbJ/g/CUaDPJyIuuADIlnszLmfCrzJF
         UmTqWqU+OteHw1QyubopF1CsVJV2k+Ng2ZoKR5uuy0rIa8XXqw3WeYv2nnWIKTb2L8Hl
         6fUrUk6Yl4Ew7rKkOtOyUSWbN1e2mCWWnIFxzGs5nspN6A84uNFSKJmokofwRMcTcmNN
         8KI//NuGqxm92PYBNUK9nVrm5n7ibvIbvx1xbokIy6P6r/MTLkJk+tHsXm5AuWYZFPPW
         neQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716379736; x=1716984536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee+lz1uwo7ctAXz2XE2Pj87WD7POTM2aqHSnKbmZAtQ=;
        b=TZn+O1oC6RznRoQISCj3EWIEll/YX/upGCXjy4jUUNHXDn3rz6l1XYHSenik/Q4AC7
         auGkFfOFX6B3576EO+XJYUlrK/Ymn+rGbOWcor+DdYB4hTYJd9i5szJ3GqXR+IkyE0sS
         T5wIv6n9406HZsrV3psoe9PBsw4hvG9b5unUq0Yra8OA9aUaG8jv+QF9e5sjm+K1H50t
         V6VwDEOY81r3sJuqXgcOA4mg4Gtu74TtQDVtyvIARM9tFl9eTgIiUM9ECiJmgQlJfhYf
         ReXjwjiFtVKprnrYR1+GLpUffFHcNM2NGds4Zj3QV9pP49OvpB45KUx5QhtvU3l/jnrK
         09JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNk/IllDCBQDvtRYKMUIg3lUdibMTfU2iidWVURg0WZKcLGWugES+CDjrHA5K/LFrydALqHAPfFMgEVUL0ce3ENjZVMhz+TIXQj1Qe+Z88Rw==
X-Gm-Message-State: AOJu0Yy/eMgttTXn3UlTW+8mhuIYJh3bLIzSupBVdCubKAWlKtQEz/12
	qFTOp96pmoK/XTQw+76dWbOZHa9emM+6zvKBEVCtdFjUjMweZqhRtFVQ3qg3K/o=
X-Google-Smtp-Source: AGHT+IG5NM5/ZE8ywwZcIByklcnTb11nbfTJMIqyGgvzCbQGpT5W3VlKw96Nno+5ZmuQw0oIwzUtmA==
X-Received: by 2002:a5d:4851:0:b0:34d:ef22:70d9 with SMTP id ffacd0b85a97d-354d8cdbe59mr1347080f8f.15.1716379735946;
        Wed, 22 May 2024 05:08:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:82c7:3445:3b33:6c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354e720d9afsm999226f8f.113.2024.05.22.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:08:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 May 2024 14:08:19 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-topic-lemans-iot-remoteproc-v1-5-af9fab7b27f0@linaro.org>
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
In-Reply-To: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmTeBR1uZXalkX2xrGfsq/SM1fgHfaFptvwi521
 t2pezyZ9t2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZk3gUQAKCRARpy6gFHHX
 coBdD/0T7qi1zHTGuexnRqWRenkfob3q2HZpY1B1HyofNAZYJ42r1OZ8ocnJr7H1gj8M9IrzLO3
 6XEStf1kIFs6mFXNa4JmZuZxjgPO9vvh8CsyUj4NnC23EfpfBFGwRDhiIzIJi/xDQzNeDCI7ukj
 0AzsrxSjHGQ0KiSHBfVwaU2ie82vJ8x+beoq1Fdi2qZKEphRKxy/QiM0nYvYl3fbZ9A8vH7eR56
 HDs1Nx/tILe7OiJ0oGHG7iqozN2TklumKeIx2mfDO5Zla8FERlIqHyoMMEKSScdY/9SVunk++pV
 nFqVfSuQeYZDoIfFNAhZ731DtDoIHEOSVUfQSOts4h29sgxnjOtdzPXcWmOboyySB1PgUqfwZb8
 h9isRAWgxzgJMFxbKuGgYU+RTcC7F7IvDEtMq18G/cN74N99mpwjbx3FbO3yf8iz94WEGkLNL/g
 rzeKynJoRkLxI1LioQAgqjv30XMVs3wRM+1WCgwyc0w575sOFIduYyZOVp0LsWI5etwgkhQs61E
 KDWIht5cM9GNzRUl3RzhcaIkGmYGSHQ/FoNiSR6wu/TV53opfZLExRa4XPKWwBM+MbOu9QrsExo
 bddr8aSa2dAGBvKCMoPEYofIPz4SVbh7Y8mG2jiIX+cF9GjJbd8TE9PX/MgF1RYU3fx/1fnEJ1Z
 n5PiP/Q2GzVSmgw==
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

