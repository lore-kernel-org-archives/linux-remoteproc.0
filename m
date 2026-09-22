Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C137F75E
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042300; cv=none; b=WJU/101zMsX1XS0PL6kIUsBoykXbPE4ir5S1dDbWxUdz0bHRnvpUlf8tpFv5XeHUNZ28gBTkVGF8SJb/HoE2c9gZWjwjWU0Snl81QeRNNX4aMTQXSZ/ueYExAY1vXZd+W5nC/0R0p+aVczSmRoORTTJjTuBrdID8JN5p2/g9IT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042300; c=relaxed/simple;
	bh=hf+Kxpp/yXFXV6jcgzYRZUrJRwTE4C1ct6LwZep6Wq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZr0FrAE4UAJ08G1T+U09FWbWH9Z/TVWEF6cAU0blUsglhL8GD+VsXb7TStudftablgC3O7tVfxmirxGRaB3cEe9lVeZ6RI9dRlIVomM5kqy+JiD0YZGTXSsIxmYHMn7/idR3DIWJ1PsGE02bkaxePwNpRyupXiMi6r9qWAdo6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/F4UKi1; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/F4UKi1"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93910ad2273so435533685a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042298; x=1790647098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vjiteTImXsmXuslSP4NNoup4Rvn5ARBQNilFYjfyEc=;
        b=D/F4UKi11gd1P6VCPUyXetGnKdOb9FdoxU6S8YYQdw4uMi2pE0aCckC7ZHeXqkBJG9
         VcZuAiK8JGnvhJgUt6Vl68v85kH/inQ6AH4Fl0Z+v+ugO7eRJAncPwchn44cm4aNnz7a
         u2bqRSO/dM8+lslVUOmnWkXEhv4b/qdpOPE1cXcrZ7u6PBKwuLOuLIDKZ5Qd2bqJgd/e
         KS/V3l/UB8XnpmY/ZBJnPdDSeuQi4ZpYLmM3+uAOhjKn22Ntm1kdWaDAxyt1kl8ds10y
         VhyXvQ5TbXSjL2nWzTm8W1SL84nXON2drH9KmNk3c8nfESDs50teA/6to9VyZadaMPxP
         pIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042298; x=1790647098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vjiteTImXsmXuslSP4NNoup4Rvn5ARBQNilFYjfyEc=;
        b=1fezDq8AzZkMrMT+z4QQeyKWIRaIbMqs8mACzAtQ1Nep4ljufztLEMODW6WHcT3E0o
         Izn0Z+Sr1DGZrPL8ASPVQMDoqSItSRJtEKUGDsyTGgBi2XmiHf3n4al1aPov2s0XCfL5
         6TzVRT4yXuZbKm07vipxUOyTPvu7DjGy/v1z65s8KpuooV66QCYHfPy7NjlspZe/BhFf
         9Z7H45AYajOZ2fDQkJuSIdTC8Uf78NxCJaE+E9ZhcHiw1F/xmLL0o80HbRa7rleMm06X
         jq4t/839L1coSRc7DZ26jhbrRkFktwqtJrJy9BYIc88MvEup/0z2xRUiF5k8cf00OrC5
         gaXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdKGrwGtYPnGTWpKBPNM3HTpk8bnH21yi3G4hbWhKhW2FgcrtkOsfKY1rrQJl/FxttYGsZa5pN7TS/Og3YDYfo@vger.kernel.org
X-Gm-Message-State: AFuF++k48w5PNMVF6aYa7c9+lpBwrsc2VdZaQ2FsgwTBEk3c0PgRvZCy
	A/WDgV99GHe6qkBUVByqtHS6Lq4gq26VUmk7LptHwY8FtZ8YekVTma/o
X-Gm-Gg: AYBFou3w47gxJRkiP/RCtQUdVP9fUtJfegVloF4Jb6uGF2hA69nke0lrFDb5Rbho7Si
	aGcdwpI5pW56VxZJw2lYEIlYZVatSdoViYLTKPpjHWcjyFubWCasBUIw7DP/qVa/2tNYcYig2cj
	WpH+vQvLAvrpQmC5i9jVHjYFAghoKo6tsKGR9Mb7oRXVEByf1ZSz9QXl7/zWzKdo2CBTt+Qd/ng
	xK/wgjxHFtfNNTm0bAZtEqKGwwpZX7Ptcf/Y0beN0BXuEuL37n0rjhvXL1skb4mZ3FKJqB5ejgQ
	EpwmsInGBhVMfnHRlKxielINnXR6gDXiSFwCQ6AlTkKVH5WMm3hHsJ4w9Fchxw8AQ7DU1EcJSFh
	IAT6J/osI+DCC5ZawpXGAyzm1od4H+e/94gSEfcIS0ZBCY17XZAIbENP9Cx3tnDHRxLhlkfW7xe
	IoEOTY7APGiyamG5U0TDLV5TR+hskXinnBZwnpsXP3Ht4+TzaCCUZ+iPkDLFEQOmdwkoZrXLInE
	A==
X-Received: by 2002:a05:620a:1b9a:b0:93b:d7a1:ba1d with SMTP id af79cd13be357-93c15ed0fa9mr326305485a.72.1790042298089;
        Mon, 21 Sep 2026 18:58:18 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d17afc0sm16530485a.18.2026.09.21.18.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:17 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 07/11] arm64: dts: qcom: sdm670-google: enable adsp
Date: Mon, 21 Sep 2026 21:57:57 -0400
Message-ID: <20260922015801.32373-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
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
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index b4854801a5f5..70996b94cd33 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -196,6 +196,11 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.55.0

