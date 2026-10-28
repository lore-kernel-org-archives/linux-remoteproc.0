Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211040;
	b=DK3kqc17AOI8Y890aQrThU2k9VficwdxmjMYpc5mR4x9mSHKhyXvAw4camxNQ0XOcMrj
	 nMqNIDKqi3iQ9VWeSWEERt+0k45tYsp0p8fBRB72oxaiUQuRAEWt+Kqy2r+U7njmazZyU
	 X6kejdZMUcFbDienKEMrdKBIAhBqQ3U11bmgPQ68sDCp/0WF9YvzWjLdZ98RNb9WBFNFL
	 ubfIP1e07YWeBq0iZHAlhz6ygWRTZcQXDhH5As3f8TvOz7GMi3uXU5GI7nkGeYRqAjdRp
	 pRo4IfWJ9mTQWwGI4U2K9ZGH/VX22pScp8rSxNM8R0SVeU5MUZ6X+DnI2sxZy0+tQhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211040;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=a3KG6sOZs9Nah1pR4lcbVYq2r6kNoFl6uTMksHc3z18=;
	b=IXi3wqPsPjsjLiSSqIUm2N1Ztt9lHb8zzi+grnl81GhgW3OwcB+u20jafzZgbK4Pal6v
	 b1QSNco8gNX0Jc5xdhu/vF7zdR01dC1QQRBxMQauSrSPWo7uNL1h0qWmhfPODeA34ys8b
	 zv7/cs4PW69VnxzuPAk8jSFWv/boH2e3vhr7VXbC3ebzlLDyuiWoLiOhmqxbrpf1Mtx+Z
	 7bEU8GiSDgh8youdQX5ouVD6Cw4WK2fA9YpuWz5CFwCJu2j/8c14aMiRjAwAhotTVA7wx
	 /Q/6JuDEky2nR7+remUYb0A982kTfIMpyi42VD7NfVBkMQ/enXYkj3B93Ri42lRWTQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLTctdOc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF860A3828;
	Wed, 28 Oct 2026 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLTctdOc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0631F01829;
	Wed, 28 Oct 2026 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211039;
	bh=a3KG6sOZs9Nah1pR4lcbVYq2r6kNoFl6uTMksHc3z18=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=GLTctdOcL8BHz6/eVpuY05eELzdU5FKOvKmN3zuovNmh+hYPf7dgCFGIESjybeshk
	 bjMnG+ypBEM0ek7FmI7hxWoiHbJ2QJgZIIeTZDgkvkek2WAWMTmm9sGZ0m+PixtFER
	 jgwAW6pGdcoEDvROm8UcRX3k4gICHQs0Ru7iv8P9o9vAJECcvnYei8En3eM9E5Q/vB
	 tVLNEB9bam1ucQ6SnolFtDgvjb11VC5HVpt0lOCZPJrBoShbJFFHiYSEySHZ0tY0jq
	 91yARLpwP+sL7Z4IlSjRvgzqyddjkhZs7X0aR6J5WNH0FPdrEuwEYye1oZ6T6B8ZNK
	 ZUCwDrIyk8WBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B16933AAA76F;
	Wed, 28 Oct 2026 18:10:39 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261028142349.19495-1-andersson@kernel.org>
References: <20261028142349.19495-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261028142349.19495-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.4
X-PR-Tracked-Commit-Id: a6e0c839f999007721d060618b6ca2134dad46a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9350d59d7c186608a86326f2dad96ee6a2c9842
Message-Id: <179321103837.1342141.5392744673435098925.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:38 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andrew Davis <afd@ti.com>, Francesco Valla <francesco@valla.it>, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Yonghao Zhang <hyz3367@gmail.com>, Rahul T R <r-ravikumar@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Tanmay Shah <tanmay.shah@amd.com>, Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>, Casey Connolly <casey.connolly@linaro.org>, Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>, HyeongJun An <sammiee5311@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Marcel Hofmann <marcel.hofmann@ingenics-digital.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, Rob Herring <robh@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>, bui duc phuc <phucduc.bui@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 09:23:49 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9350d59d7c186608a86326f2dad96ee6a2c9842

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
