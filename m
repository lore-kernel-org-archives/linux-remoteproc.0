Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C11C3306
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327066; cv=none; b=i1IVLEOHncJkKjqQbAcK93lE6T3V1ZV5cUu/ibaeAgg8eZE2Ze5dFZ9qdqYefr3EPhfqk4ctXJEVEcV/rjRCbTxncouRci8XvXWC2vfqEsuv+8wf2O168J7drq7R2fmmNSXuqAdOVHrMd6MipUDZYLboYv4dfy5OxuCnvd7KFxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327066; c=relaxed/simple;
	bh=kMV2klR1DStzeKF01dgOaxxEEFLWBWwy94a3z1Sv2lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0OdkYgD4BsBE8MdVQwjCtGqYJrBlLJm/NSLwUgmL0AQ/RjS1xBzDuS7ouRdaWIWZaa35PAkN7D7ugF0r9IDxWI29VHDzIfxp2TH2c7d/Ablg0Zfqi3e6X1puQdLL8d09tfjRyadGMtTlr1AYvSSY2F+TsaTccMXeIOCukoICb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek/7y7xT; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek/7y7xT"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c7533dbd87so5427395a34.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 16:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765327063; x=1765931863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTnBfhCPlftBcGJdY/ReLgnu94bb7n8RiqGchanYiDU=;
        b=Ek/7y7xTnPtM6ZvYYrhiuJ8zoWIsOh3W8CvyjYjorDjpDgW44/80kZ1pWAG6BJmQPh
         DAt1bYMzjvvHFzVVQoQGv4xY0s5FDeEXl8ziMZ2g8qj1y21Dd4GnEaQIfVki7G5XyJqL
         Z6nmEvtglTzAUlmjz2z7p7N9V7DJygqwM4NnFnzMc4QSvqXvzsTJMOuHPxS5DUScxkH1
         xXrz2Frv6f90hedYiA9daM+9ohmOP69aZfvYVzOOfMa4i9UXF3KmGbznC+XCnIHRQXDs
         npz46EcfWgxeA26I0i6vHJFvKs1Fmue2/0HFE/qN9MrbbAErr2WEuwnhoIWAd1UwF6dO
         OOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327063; x=1765931863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTnBfhCPlftBcGJdY/ReLgnu94bb7n8RiqGchanYiDU=;
        b=dwJlGRrYVIQq1fV+e1hjIYyrOfElxmPqrdpys5ZYN+BxmcqApPdJHTndPq3CyzfYYj
         Q6Q20ZPtxp30edy1DcQF/pmhn1FzhVdh6BN8i1WtTXQ9DazWL1ij7PmIHeGXNIulcXjw
         Ay+Kkrc6BAsQw17PLFdFFPTq7oiIBFcr2rCFdlx/WmTfpwuae6hKAPHIpB3uTLRP1apK
         gi5X+sLx57BwI7xZnJACvLcaNyVPsOuI6gJJynXBm3IS01YvkG4WooNTsp0189T+t0Vq
         kHyJYZfDTdg9ri7WZnC/5GeN8XXNvoqj+wSlQRwdeo26n5jCgQJvT9vnbJ8LqcZSev7u
         vnMg==
X-Forwarded-Encrypted: i=1; AJvYcCWF9VgmJoLM7u3prm7wizk362DkYWv1WptejkbBRXiMXGvrDoj3C948Y25hvcII5zgP6gy8mr3boHT69F/WTBuA@vger.kernel.org
X-Gm-Message-State: AOJu0YxzszSuUFLygcK6OmiFOJKx774jUBNNme+9Usye9uyLq0RUmuVc
	mzQbtbSmSDW0cNUsf8V/um2un7hHGEZSEYIIZ8R0rJr6n4VsYxt2FZ8l
X-Gm-Gg: ASbGncu8cw2l3nocXf2FzSnPFHUhDanX+sFdEOEH6RJGhH695/9vbTotCB90xe390yx
	Ijt8Bk4p2qDeg5KMENJQAV2QWPFj1gart0BQV7f8EzGzjNfa4gxDheHymZtbGDnbbyvzQ/915ru
	nAEjLmvwev/uJsnRFyDw0m0DCynmWgP/JCvGWT+gJr96eOdWeHaFttU1jTc9zIxI+Ipe21sLex/
	N3lZgJIRZCNkhlUuO7WXm5wkeEJ4AXJKsy6DxsUM2+deLRn1+6gtujxcA+TvvyEGVD1DSG9BzpH
	XNugNz7qid/vAWAlW0i9GSiUyg1KaHeB/Ved5oWmH+vVvFwJ7lgt8SrkSsxZ+41tCfOYCHtgQDf
	W2+mndWGcS3oKt66L49DNKglYJOx0B9Iyzo/ZbUxEBGro1gQs9hwt/NuyPtm1U1yqgy1WeyhS6d
	l/oONScyM6GWi35LHJGNDr5TFz22A0mLYBUmBebaw/y+WSQPDqzXWC7+6Oq92dJTwg1G7N6/TH5
	ap8tuob8aH76jnuGtWkl7ssmm6Z
X-Google-Smtp-Source: AGHT+IFXtFBZQ4Phs+DA2gIk8zEB/PSTinPp9kLxq66H0kohPSDEsTuKzeL4L4ahy6FStdu0aIQDxw==
X-Received: by 2002:a05:6820:168a:b0:659:9a49:8eba with SMTP id 006d021491bc7-65b2ad5bca7mr509385eaf.62.1765327063516;
        Tue, 09 Dec 2025 16:37:43 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ea6807esm8588826eaf.0.2025.12.09.16.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:37:42 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH RFC 3/3] arm64: dts: qcom: ipq8074: add remoteproc nodes
Date: Tue,  9 Dec 2025 18:37:25 -0600
Message-ID: <20251210003729.3909663-4-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the nodes for the WCSS remoteproc loader on IPQ8074, so that there
a use case for the DT bindings. GCC_WCSSAON_RESET is not implemented
by the GCC reset controller, so use a placeholder value for now. Leave
the node disabled so that remoteproc doesn't start up with the missing
reset.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 79 +++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 256e12cf6d544..86369fa680553 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -108,6 +108,11 @@ memory@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x400000>;
 			no-map;
 		};
+
+		q6_region: wcnss@4b000000 {
+			reg = <0x0 0x4b000000 0x0 0x03700000>;
+			no-map;
+		};
 	};
 
 	firmware {
@@ -390,6 +395,11 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x21000>;
 		};
 
+		tcsr_q6: syscon@1945000 {
+			compatible = "qcom,tcsr-ipq8074", "syscon";
+			reg = <0x01945000 0xe000>;
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0200f000 0x001000>,
@@ -1003,6 +1013,50 @@ pcie@0 {
 				ranges;
 			};
 		};
+
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq8074-wcss-pil";
+			reg = <0x0cd00000 0x4040>,
+			      <0x004ab000 0x20>;
+			reg-names = "qdsp6",
+				    "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 0>,
+					      <&wcss_smp2p_in 1 0>,
+					      <&wcss_smp2p_in 2 0>,
+					      <&wcss_smp2p_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			resets = <&gcc 0xffff>, /* GCC_WCSSAON_RESET */
+				 <&gcc GCC_WCSS_BCR>,
+				 <&gcc GCC_WCSS_Q6_BCR>;
+
+			reset-names = "wcss_aon_reset",
+				      "wcss_reset",
+				      "wcss_q6_reset";
+
+			memory-region = <&q6_region>;
+			qcom,halt-regs = <&tcsr_q6 0xa000 0xd000 0x0>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
 	};
 
 	timer {
@@ -1182,4 +1236,29 @@ wcss-phyb1-crit {
 			};
 		};
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };
-- 
2.45.1

