Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2603DC4C6;
	Tue, 12 May 2026 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617440; cv=none; b=oFed6lan9nid+LRZRhIoF3OcDDcAKXYGzsLp8gFLf5sof6TEOzKoIZGHE77C8IZXMbVjGDzrRrj7k+O8IQlhXyD5xSKr0QbI+5pLSn7C3ZbzDfbKbp3F1wSaTsd8HhjURCrFqgca8hmJKHbwk1U9cI68mdj1XOxgIg6Tr1tYySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617440; c=relaxed/simple;
	bh=ZvrhD8bVbre5CK1X/wpT7ae78DFruGLOKCULy+IWCvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Plls/8l9GsjTCHh2rXfZDT/Z8P2CkJKMle7S57ig7CZFC+z1RzO7CXYdELViDY9kumF/jHIbb+bNJPICOr533MF1XHfAGu0DKm8wcwD+hmW2Hd85UluHUiW6gvB9qvF/x3eu1TtNuEVSZqBviDH3ge8qNDaN+PCA7Xye2YH13To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqEGJI+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqEGJI+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262A1C2BCF6;
	Tue, 12 May 2026 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617440;
	bh=ZvrhD8bVbre5CK1X/wpT7ae78DFruGLOKCULy+IWCvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JqEGJI+7m+oWXiCHUPLzlUVnRWdItXiFNsPTyOCWEe6zuHFhgu6W33xoUUM85MV8U
	 nEg7d6uRvhpSOlAXPp2lIcD+blOHjEtcGt1k3Tj2YezzxBS6DDlXnXxZrQR7T8mhNr
	 1uhmYReVySr24IamyCfcvrpS9KSskWImlbxN9MoUStXpena70b1g0eGT6iXPcGuF/G
	 at92T/geEAweS3v9T/Peb6q9JeZZX3PgMiyUsZMCu+ENKqGRy5EADxKe2r3AsaV7Ac
	 4Xo6PsEIAPO2PENwZv5I5uyU02i7s4Bqnvey78Y49rYSZOm/XzQ/sWG1P9Mypp1w+x
	 YVvef6mzlK3tA==
From: Bjorn Andersson <andersson@kernel.org>
To: robh@kernel.org,
	srini@kernel.org,
	amahesh@qti.qualcomm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mani@kernel.org
Subject: Re: (subset) [PATCH V5 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Tue, 12 May 2026 15:23:12 -0500
Message-ID: <177861739391.1242344.793126639808307051.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Mar 2026 17:38:09 +0530, Sibi Sankar wrote:
> Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
> that the firmware streams of the remote processors are managed in kernel
> and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
> Qualcomm SoCs now support running Linux Host at EL2 [1], this series
> documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
> fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
> hence the iommus properties are left optional.
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
      commit: cd1d174c75f70fb0d7204802551aeaeb84689b59
[5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
      commit: 377665c6078d1aa18d29d56a39d70ed8185cd2d1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
