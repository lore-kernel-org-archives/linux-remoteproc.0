Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BC12F7F04;
	Tue, 28 Jul 2026 02:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204304; cv=none; b=LXOYtAGIUD2dihEyNyAyM2iRNJL61m4dyvlXyXEt3DcjBTVBYJz/FNhVDQIeh8tVFZ/fprLfdJa6L+FIiyJEUvtEBN4aE906Wjn7LJKTUdV9/V0ojWX6jzynj4kvDYPbh602SAPLaCAuMQcbC2DnvklAIWnEyFOILNRZxlLqC1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204304; c=relaxed/simple;
	bh=AoaTW4MmBeHdDP9H+voK+12iDeT+t/HjVeHBTRLcuzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f2XjYsQJZ1jbf5TMmHKaMBgebqHY5e2RBX7QAT3svdgyesLav+DRDBXRhdz7tCAOyuS2znLQSat1tRduxk1xc5xWNqj432X6m90AfQYy9UeRT1HjR+2ueoKK+XB0rE6uoM/5/umtGLywy3E/CuJcl0CIida1zaM5DokJAmBtN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dy+DwWuR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dy+DwWuR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F2F1F00A3E;
	Tue, 28 Jul 2026 02:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785204303;
	bh=ETynm7ZxxvC6vTxoI5TZLxVJ+EqpSURh9h6Rg4TbilA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dy+DwWuRjrP55PkJxkFUN7mt8S4le/3w22Nrk07TEEZcaL1zeH2+ZYueq7dENuCrX
	 MjGZIAAREBFu8k7RbnoIwmh9/0W5+3HI5ZEXfyH/j3nYYR8CTT3kK6vDtz/uDmBJZs
	 d1YRmWZOrsdWwAXrbuiNXt1aFpvl/mdcYC61E18Ly3nZm3bHXIoz1q7dINgzdAg3s7
	 kkZAz8HCOkcJAl6DhSoEQkfoWZz2GsS5ZZ89H0FemIh2Oq/ZZCa/flqsAXqNd1yMqv
	 5lRU/E7JFiLT1EWJ0b2S1ClrTu/2jNSbvDcZLx5kwJjscDpckkkLS3VO6uHotRHtq6
	 c7Uz3+e70I+BQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Fernando Guzman Lugo <fernando.lugo@ti.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] remoteproc: Improve removal of remoteproc drivers
Date: Mon, 27 Jul 2026 21:04:57 -0500
Message-ID: <178520429369.31699.3843315886359941445.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 03:52:26 +0000, Bjorn Andersson wrote:
> Stopping a remoteproc that has entered a crash loop can be problematic,
> as shutdown is only allowed while the instance is in its running state.
> 
> One effect of this is that a remoteproc which has entered a crash state,
> with `recovery_disabled` can not be stopped, without first attempting
> the recovery.
> 
> [...]

Applied, thanks!

[1/3] remoteproc: Allow shutdown of crashed processors
      commit: 2482ca875ef5993df8daee563033d70e2523a25f
[2/3] remoteproc: Prevent crash handling to race with rproc_del()
      commit: 74ee3b2f5767447c57959994341e5b95f1079977
[3/3] remoteproc: Force shutdown during device removal
      commit: 4059c64d78b5d543dabae332922e763b4c95c79e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
