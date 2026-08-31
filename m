Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0883C3812D1;
	Mon, 31 Aug 2026 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194943; cv=none; b=TdXvGL3Kx3DJR//9nQkuJ0P+QkcT4cOEpYUJS0I5RW8LCeeS5m4Huk0bBGeuNM0s8ju3YhPLgagDOEGf7WYKNarvW25xBg3jb1zApYI93+X+qbysZ1XsrfPA5cl66m0oxUwg0fGQ45EukCkoygKE/4gb0vk105OvXxmGlOuIy7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194943; c=relaxed/simple;
	bh=7AcdBq83d4hizGC3LDY/I3im+a+30qvtkRGsBrE4xX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YNTKyzI/+IMAYJuuILvWLB03+FUGXZRbk1guW90dUx+lTg753+f9LN2ybRL52L2Fm+/PJKXlwQx1i/XciTXG0ry1jnDfGa0NfAGNcIRUSLzjBDPqPKwpyNpoZRGESFoCL7fuu0udqYMx+8qVAo45VwJ3V24pk+VFiwYgi2lSaAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5NUfqLn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5NUfqLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1B31F000E9;
	Mon, 31 Aug 2026 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194941;
	bh=0eurmTeDtbbBqX91m5Jcws1+jUgTOhXzhZOljPZXCaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U5NUfqLnhVUfWpGYn0XxGKrHOwEnMH+aCt/oyaYIW+B3/voAYcQ3Tb88Z7O9xqxn5
	 I/aSsVsnhi0IX1cRC1w7S50qq6f7ilieRZIy76at12xR8Hfbe+7EssUmiCevzT5Tk0
	 qhsOxjC8zg8uF4TfxJYElthw0a2T98EpFK0Oh+PtdT6EiuFW3UoKsScbwwJn/xh4Ie
	 Br++1FeK2A5qrS2PolOcnmkXPg8+KiDarRYDmyVeW0gCBvAl81iEAmZ0xWq6PWAnDr
	 iazOqLKudazYzj0UV8VHMv5iSmtxYcdf4kfNhUz7Kk7M5rEKByKWUvJLu0K+lM3gJP
	 ci6E/W4sOcLcQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop()
Date: Mon, 31 Aug 2026 11:48:52 -0500
Message-ID: <178819492789.1319417.16640394210914739311.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
References: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Aug 2026 11:00:30 +0530, Vignesh Viswanathan wrote:
> In qcom_pas_stop function, return value of qcom_pas_shutdown for pas_id
> is overwritten by the return value of qcom_pas_shutdown for dtb_pas_id.
> This causes errors seen on qcom_pas_shutdown failures for pas_id to be
> masked to the caller. This might lead to issues where the memory regions
> locked by PAS, as part of qcom_pas_auth_and_reset, are not released for
> access by linux and rproc_coredump flow will end up accessing the locked
> memory, leading to an access violation.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop()
      commit: 9db31edf92dde1f3c98008bd5f88e859d14324cc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
