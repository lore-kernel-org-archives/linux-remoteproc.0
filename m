Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9E4A49A0
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 Oct 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050240; cv=none; b=mZvHB/iZk/oNZH93zfXbtWMrYqvcDR6XPXEfSosQ/W4Vmr2QjXWu06YWJspsdjVCDZtPXyyTbEv104Rv8m3yO1md9UvFknsC0cjz6ukJkW7nbExvbETj4swiXM0IXuZrX9anw1kNFcYkY6Z6zvuxpffO9uuri9KbGUD+jSN5ISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050240; c=relaxed/simple;
	bh=2V0qBXWkQWaJIHJgjhlGvc3Gd47a7McRdg7biTgETbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li6x0OJtYoi1Xgkm6WYt7TKPnUdkPwhFCGJgAyMkbUbwtK5LWZ0TzmbRyctWXsYXK0TDd8k+zI65THWxoh3nJZQ2cEXpKlyTy/bLXf8HFXRu/wX5kHbjyiMnrRwQbP9oEiAzpmCNS/GMr6abqo3v4Sw3feFKqCHoBWyb7wX4By0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpIl5tr7; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpIl5tr7"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb769ca17so3620371cf.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 03 Oct 2026 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050238; x=1791655038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/zOvoPnwXNPf5C8d03bW80XrbdlIDkEOSYK24yCMxA=;
        b=EpIl5tr7xAhCJ9UR2LO3Oz4s+9aY0bS2nH3LmJ/y7ryAU4rEGclI2X7hkVDxRL2x0y
         IrfRL3wnNTl1ZLThdQJIqGVxt890SgUZrUxKFA3xI+ZcnXVlyS2HQpE4KdFBUmCxrxcQ
         zQG/PO97YlfaK3gA1D19QZ+Yuf0N0XxcT1ONXkcNj5Ppj92TIvMUxHf1WKJb9JRInmcn
         9jOF47Rc3TFMbbVnGhhpJ1pfJuODdNId7/3x1DwVNTJArYFtrlaprkGNAy3vu/u3Xgkk
         Rp1N1lc9r3JZuZTSv353TQqN/rSZSewwE4igJOETAkmGIVmAGoev0M+KWBr7eOiN4uQB
         td3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050238; x=1791655038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/zOvoPnwXNPf5C8d03bW80XrbdlIDkEOSYK24yCMxA=;
        b=qsQKTNk77PDvfC0CilskfLx6+iRZX1CUxBEE3qgiNANoPNse7tfPH/KsjwV28Zo4cR
         IlnfIHuSCkhN+Yo0b9Mr4R054E0MvuBsJQzBmsxTKE5awscAMtv82RG2sgRwVLXstHxM
         p9oxZZUFl1HkblXJq0hZy8qItJr03Tm+9WGz7Uih6xEbOWSLqTnl8yVEaMYFp1GIcCZd
         V/7hKj10+kh/IOnSpXpexy1hIYslPS4zAnvFtpxCpnGa49YnIMwOO3R2hXsHpvbhUCPQ
         dLc3LJniAMefp9CEfOOHpgex4yUoQ+PmD4Mss8tQ9TPcPH7+EDGqX9HkiI+G42RgJPYS
         OiZw==
X-Forwarded-Encrypted: i=1; AKwUvBw84W0PWlDVC68fYuE9iuS1e4mAEhfyaDK6VDYXiu+P19bniohgb/21X1k2K3IwPB3DavdrLZPjddVGp3L2HcsJ@vger.kernel.org
X-Gm-Message-State: AFuF++nLHFDY3QxmB1GXDeCF6HU8S8m9r9f6I3RQCQWwAkHh7oZYfjPD
	XCaB+38KfCAYtlTADDEBbLj+3WB85pmmw+LUaSRSh5m5Xdih6DsF9Dpl
X-Gm-Gg: AYBFou0UX+mvcSSLMwgQRpX5eMHSuXoXjYzt/DxlNb1K4qxY8M2RVNVEgLg6l0XumHF
	Na5rKAD53Z3PUu3T1exDR2Fph5LShyVMtG6oRbdywHxHNM4aGCWrNHJ7/q52blVaOLj5zn9A9LH
	ka4XHn4ivniKkttohFW74Zs/Vhg+qq8vDPSvyCc3JEfiUpElc9XLWy5WIU6hT0PVNsE/GzPmtWZ
	q50NLyo028Vj9yef71j1FAbUX5LvRnNABWxl9b40Sxf6htVgceFz9Qn7i0g+DnRvxtmAVSdVKhq
	n+SypNeWoR+45qLUnxBFp0NaqotygZIwCy/fBeCUVbZF5lSH9Y7XYwNWSsY0y6sqNYhRMrmYtG6
	M7rvxTJXcbZ8eRGJ7lKj8N+CsPoJUTA9fBYzjVUUs5S0ljnrmmddw58Iw/HY9DodttZLKmvZTmI
	flaXnzm2icPTrbyOBywabg8hLVPl3SmMZSfOohbn60P15MzpDoY3xtRhlc/zNtH3tZGtwmqPM3/
	qKFZNNpWuGC
X-Received: by 2002:ac8:7fd1:0:b0:535:753:4b08 with SMTP id d75a77b69052e-5350753550amr92217291cf.17.1791050237877;
        Sat, 03 Oct 2026 10:57:17 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-918f748c54bsm43302276d6.9.2026.10.03.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:17 -0700 (PDT)
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
Subject: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
Date: Sat,  3 Oct 2026 13:56:56 -0400
Message-ID: <20261003175659.23536-9-mailingradian@gmail.com>
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

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index b4854801a5f5..73639b0271e9 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -196,6 +196,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.0

