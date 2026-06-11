Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762E28C87C;
	Thu, 11 Jun 2026 01:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142477; cv=none; b=SCCJ8bYCKd+YdtwRV1G9hdlQO4AYCMKqWCRN2ANbeD6+z95a79OElkY2GQQkkt8B8OJgnbhtj6hQ6k2OpyXBdEppo5V423qO4PuAMb23VcmlVvM/+9J4FRP1zN3erMDOiGxLtQNApb3rQj9ACEcq4q4FHmZlcyKlqVC/GWoDDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142477; c=relaxed/simple;
	bh=5ieW4Oaerkvlro4GmdbXHQ34sl2CK0ZbXa1B7hlloJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/5evtF0GCBgpqioEyzK5MtkLEVW503AgHS/A4r30+i5AYAJkzyOHiZr6+QPB4IRNmY7cbP224LvvYKqAFnrATcF98QDKPuQ6RYSs+g1II04iTPUjvTCpayQ1rZH8e/LDLCUv/AoiGrZZKSmimjw0MKV6lmHW5ykZgfEnCI0KnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+A17Vos; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+A17Vos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596B21F00898;
	Thu, 11 Jun 2026 01:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142476;
	bh=Y6A9lY2wOBX6mv9cQW2cLkElhQ8Xpz6G49i/I6XDyIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H+A17VosjyxMdPCS9rAFmBXm0bULopqly315s/+zgQWWXGdwTqAbTdiBwHMWjcu0Z
	 TLLE62WhELMwA39hw048Xo5m+Nnko55iGy9Xtq0Z7XUWjGgenaFTADlvXrIOOOhZEM
	 hBXKUgnangKW8lDdth1dsPkMwZG9FbulJ6OoGdiTCWi7ubas/gy/e/5R/KIdkmLuOe
	 4uHPuD5AQNrhpQuy+v87TzyNkGcA8Z14xA4iV3vRB354FQJKeyH/2Zu39RVreP1D3q
	 gyQVOoatBpUpnR9dCJFLukX8KoQOKWxjKO2JXpasaIcSXx/McefwFQUmjZ9U1T+2v5
	 f0nw+91oU2PdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add compatible strings for RPM and mailbox devices for Shikra
Date: Wed, 10 Jun 2026 20:47:45 -0500
Message-ID: <178114245722.590736.11826462854744083593.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 May 2026 16:10:45 +0530, Sneh Mankad wrote:
> Add support for RPM processor, rpm-smd device and APCS IPC device
> for Shikra by adding appropriate compatibles.
> 
> 

Applied, thanks!

[2/3] dt-bindings: remoteproc: Add Shikra RPM processor compatible
      commit: 181836fb3aa6715e3dcd899c9283daa9dfbb91a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
