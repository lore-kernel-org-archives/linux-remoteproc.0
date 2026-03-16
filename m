Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319B630C617;
	Mon, 16 Mar 2026 02:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626564; cv=none; b=P9Jkjl4iMayuvMdlM61hc9A+vlYOYF2ATKHY6SmIgGGwCW647hWQCSkwsJzvZm6Aamkyf06fhhCNMijT54YaoDXRj9r95txuB6Ih8u2QI+LxX7fDPzMNLhUuu8WruiGGuXxdH19H2Vm1UF/rfcYzOZFhOJyfWaOhM+ouRWH+70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626564; c=relaxed/simple;
	bh=1rniWbs8wKJFLAz52IKvGUUEMXY14VYrjP9NXuQUYa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kXUZwkhrMeRmYuDnOTgfY/AF20aGwCdPfwk4uzgbBZESLHd6/v7D49LinGg9KWHxW3JsBH2ybSekYSYpZw0WCzKC0sF2pLcXgIPqm9otldTUF/USolYiltcYJPPjezIJhuhLtPDhaxGpN7JVZ8MhXvvaoEk9de/oCYucqmL2unk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZjBdcW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZjBdcW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C10C4CEF7;
	Mon, 16 Mar 2026 02:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626563;
	bh=1rniWbs8wKJFLAz52IKvGUUEMXY14VYrjP9NXuQUYa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZZjBdcW0PEtedHR5OXtKy94ae41Vr74gB1wsXVcaSG+Lx1CgdqxdBW1W+RJHUKmL9
	 UDW8FXD3KYeeTLNZp5pNjdVpUdsD3K7YflVibEnvkVMGuY3H7/OD/8CAm11KJZuu15
	 qgAaYRgs1Izxa/t5Et5NfrZVcl7S9e2zCUSjumBTw3tsupHDdxOWQlhmrXUGw3qKRj
	 3UhLFy0d7X107K2DzHkGJaTlM4O4RGA+eT/6g1jhPVZ1p/7HZ1YTy2QuSPv4TdaJxl
	 3dQUq3aR8a1d+aqfcVp43F0jbhjnFeAdRVGA8If2MESaSyIuDB+MPRpygCGWmngmmc
	 cTuNqEJLRk2gw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Chris Lew <chris.lew@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] soc: qcom: smp2p: Add support for remoteproc early attach
Date: Sun, 15 Mar 2026 21:02:28 -0500
Message-ID: <177362655067.7429.10097680594827277371.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 27 Jan 2026 16:08:44 +0530, Deepak Kumar Singh wrote:
> Some remoteproc will boot during earlier boot stages, add callback
> .irq_get_irqchip_state for remoteproc to check the states in smp2p
> and mark the state "attached", also add smp2p v2 support.
> 
> 

Applied, thanks!

[1/2] soc: qcom: smp2p: Add irqchip state support
      commit: 8a9a7b9d14c21d060301a8dd4a676ccb4ade5870
[2/2] soc: qcom: smp2p: Add support for smp2p v2
      commit: 42c4cf5d482813067789dd5ea2e33f3b7805e7e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
