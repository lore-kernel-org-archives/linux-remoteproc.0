Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018408;
	b=Q7oldlJAubspQl49lpJt5eMyjuUOLjYbMhrB8D4dc77F6DY36fQob0vcpy5eGGg1tAQi
	 7krmcfP8C0IGwftg3GxCyUglzF6koj1ZTvhNNu1JE5n6B60nA58fT3enfuoCt328fWndN
	 rpHqTWCgRidZeVSHiiDX9OvtIMfUIDUWuNcjECYAKmYF7zQj4yaOrHsDFSXv/e26Ttx/H
	 UW7wOPCqor7wVNJSCBAJneVH8/6nIbpqmlVSXxMBecPQkFRyBwWrBXFJEZb8u1uXH8W8z
	 FfOZq5Z4OsYjG2TqQDUCKaqUIaMZ697hEktB7d/YJEwItZ+KPlez0e+BWeENgBSaTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
	b=MYtY2+Ro4s1iA5QoJ6KFie3b+yexHqFy7AvKNSxj8Hkfoft470hPIAJXBzYmJ9aWCpBt
	 KQDbD1oaejuddn/NA29oo8DFvaYlDSiQm+Je7GPPmBMIkk+S+cVxkZzNpBB2FLKjMV/Rt
	 xZ/myjd/UCclGrzJhQORkFimB5fth2wnIVtKsYVcln0ofsPR2vAZdWGalU7GdHFwDedeu
	 tljp7f9jRDYBahchwloFqlrJN3ydlSTc5rbHlmzgfT6zFIRo6j4VRdwuf0mGm2DdPtjwF
	 vzTUtjvEMhr1GPSMY/3iaIQ5WdZhd0bkc/WjdLBcinm+vq/GmVLYldP8SxPfMEuZuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXoM+PVE;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89578606A32F
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89578606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXoM+PVE
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-980c4258105so656984241.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018407; x=1794623207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
        b=tXoM+PVEIEMNDbySzTyNRv74+GqQx/TyqC/EVz/BxnMoX18SthD72GQq4Bahq+E4PC
         CEUsthwvDrWJ33nOX2l3rUBOmJlZniNuTAiq0CKnyl6JXObCYwB3eOCUA8DUATNtZ+q4
         G/l467g60IVwelFb8tOOQti8G3eAEoKFTML2xwujA2gzxw8y9JWQp7HPcqcud6XXzwEW
         hs3CxZEMttVPBc1rjn+HUmxEh7n/OmXh7mgXJe2l/UzjerXW1BpDBiOkdvnYu7xD//RQ
         /jWRorV/WABXPpx8siUDxaoeexxpx0NZ1I6JR4edi/prLt88t/MyUg086Sh0qUiY3Wdh
         xTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018407; x=1794623207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7+2bs1h7+qzvrMEtIoOvT0o5eL+5r9TpcyjfyV6bAM=;
        b=OuSJSo8qxSnosmYfIbyrPL78egJuLs2osuDRi0es20KyaK+Ccf3APIq3JWgLPoQJNC
         T5QFOlDbdZYyFwS5Mhtn0LsPwCcxeByPKQaN2ynp4oU80aOoYtd3l9WiGOtxjBBsVw3e
         A2RD81ku5/0DNQTwT/uRreHQ1abVyqtPRd8x+8jvOgxaKSsZyPZndkSPGdXoWC66gvHt
         1hyrYeqDs3Kpn+tog68AxevjpHBrjYAzRzZP2l8ZyChUYESO55gkwH687dbqN5n1LI9P
         5yXe174Ol/QaxSR/6xTpb4Qb8+W8YtMJ2fbtCjtQsRqhtTE2nhVkivd2Ztl814UCT6St
         XRYg==
X-Forwarded-Encrypted: i=1; AL+hErHEAdv0HkRtzR5nwopvwugvBqtVhbM9u0dprjSCQqkaNoHnYzWKW1gIPYG/hNkRlv9MtMg6yR0BNRCWEbrAWb1y@vger.kernel.org
X-Gm-Message-State: APuU4Z9W7XWUbRfvsu7H3f5nhLeaZBd7aXyUvAdPzzlstVIxHp+T3KcY
	5ZzFnuE19Tymu5zXWbNQ6hhCNWmApGj3jdQAVQ4wycYtHBjKPG0wM/TV
X-Gm-Gg: AYBFou0hzaSwxza9Cye8YtAE6SVFOX2azf4gWAMqImiUUNNbhjIwwRTOEOUDelSyVaO
	sqkU9PvIsPJIwpHmHeqt+aiS6xXK9WYmjuCPenwbeYnc209Pp6/UjRRqZ3UCeTxpU3wLxlIujAT
	U7mpZ6EA5ZCLin/vs7vXbHfDUMHzFY5UdEl5PHl5FkG6+UgftS9+/qQxcudNIzJ/IAVamyO0453
	pdxU4PmOY6n6QH+dRIzFgrLxSuDJxmZiJvE7BDQ16NXjkXLDd5/T+OXtLmiuVl0gpZKb/2zUPRE
	kcvvXOVm5jDg6i4X2RVdc3bwvvAbKkw5Ujkmk2NiuCJrDGsSPSPDa/ErYilm81BpJh5CESQnqAk
	4Dix4aUxgUy6iJEUfghNBd+lKHiANQRKzbIf/HjTqNwDhEEwFOF76dtW+U6G+FZQnFuZ4XduF3n
	8VxtqxesJJ1AweHvRCAsSAtvsOrXeJLF9tN29Wbq63kR0wLNdTf3IrII1YzMEPy+eGgbkWYGjqu
	ujUVNSh/lD8wnyOQ7m1SfpRgmppSbO02jNfnlE+RTL7ujjBSXap95Qzrj3gvX17uQ0GZyp99Fgo
	jpXiHSTgsV3c42yYMKKMx+JuoT6O
X-Received: by 2002:a05:6102:5121:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2a15f9d96mr2571256137.23.1794018407454;
        Fri, 06 Nov 2026 18:26:47 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8aeb0sm3142542241.9.2026.11.06.18.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 8/9] arm64: dts: qcom: sdm670: add digital audio codec
Date: Fri,  6 Nov 2026 21:24:52 -0500
Message-ID: <20261107022453.159341-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index e99183c22208..3e5ca16e3056 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -33,6 +34,12 @@ / {
 	chosen { };
 
 	clocks {
+		lpass_cdc_bclk: lpass-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -2822,5 +2829,20 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&lpass_cdc_bclk>,
+				 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "ahbix-clk", "mclk";
+
+			sound-name-prefix = "Digital";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.0

