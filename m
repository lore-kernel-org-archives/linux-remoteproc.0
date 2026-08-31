Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641837F32D;
	Mon, 31 Aug 2026 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194939; cv=none; b=hncf/mLFDAVyC/yQ/hsJfCP5uioKo2kHyNlUTgqE8Gb/lDnFKPcpn66jsZb1n+Ja6qwGtIwSpCl+eCpIYY2gq99GnSgrJ923okoOzJU4tjaJpCT2TiETYr8siWkQ652TzRFNqC9p7PvHU+dy4oU4fPHDT3lSj3dj5V94V2id+sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194939; c=relaxed/simple;
	bh=+mbccWJe/LNwe6qvSFMqcyMQrPDeMoVrOFT+Cwn13Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzK1EN5j+VSpRHTBNzMvKcmU/k4HukYL4fAq0igHEKdzVESvLa5Knr7Zdc7P0GzFeoTFC+hkTmi/D5KEfZiNTgEjQ/kWkNR+i895q+qN7TFwsAPID8C+ZEQR1Gs9n3X3juBrUCrEpWCZ8SwPaSdTt8/JD6ga3ZNFvK//RDsVR0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFju6E9t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFju6E9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3002C1F00A3D;
	Mon, 31 Aug 2026 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194938;
	bh=e33bE7hzJ3NMDwG88fk/40Dn2cUN5pTKclvyVN70rN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IFju6E9tesUOeqz+rW2sOr0gzqOqgFNzsUM7BBUlJcnoBfta9h7m3dOJzzBcdp377
	 EAD9Zx3mSUEFitgOPLKiYO3zTOR8O+xkQbXFwx9LXVqz4GLMjhb3lZn0+FD8jMc9A3
	 yIhZofhFWP1wl3SeMOWv9pfpt+zVxPZRVSUPL8Q1dfsSdOl3rAOkPVaCsWYDFsNAwu
	 8kfzX1awNcv2x94X1YMnsRnXr3Ekk4FEm8Pc54MnuROFIRF08M4qeosQVgQm9mw0GB
	 0kGOgE0y2rNHPK11VjyDWkia9M8puHjK8HqZCBj6pw6EXZcOAC6TAId/asXTJP3dWy
	 DgdpmjwentDqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Paul Hollinsky <phollinsky@holtechnik.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory protection
Date: Mon, 31 Aug 2026 11:48:48 -0500
Message-ID: <178819492785.1319417.2319914259657057100.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821081540.89137-1-phollinsky@holtechnik.com>
References: <20260821081540.89137-1-phollinsky@holtechnik.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Aug 2026 01:15:40 -0700, Paul Hollinsky wrote:
> Commit f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS
> TZ APIs") changed the probe-time gate for need_mem_protection platforms
> from qcom_scm_is_available() to qcom_pas_is_available(). Memory
> protection in this driver is implemented with qcom_scm_assign_mem(),
> which is a TZ service distinct from PAS. The only PAS call in the driver
> is qcom_pas_mem_setup(), and it is already guarded by need_pas_mem_setup.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: Don't require PAS for memory protection
      commit: b853857293584dd1f52183f70a2bdeca692a1e71

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
