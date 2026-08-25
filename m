Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789143E7145;
	Tue, 25 Aug 2026 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693662; cv=none; b=RjxIdkXxqbnXEopMzM19L19zphLMdCA9zr0DvIM27mm864Iq9Nnd0wZkOVP9Utty9xytxoS6I+cGggQsF/E+ZL991LbNHICGGN57y6V6uXsdQprRJGxPlZeOFj+zXyfDhiizID47G0ERxJJfMQYcy08aGYp7vw+fZqssiomTjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693662; c=relaxed/simple;
	bh=Vf4OW7WSp7qV3isvWT6zkHJyaltQ7snFhMh+zqoOHPU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F79VSV4tCQ+8aXW9fIWv+wO+id9JJqOZg/Blf6dW1/3lqBCdf0w14JcQAlMFuqtV0UMeRw6/iKBHSxONgjnFPVkoDHtRf/cFtCHEpPRPyOVB5JM4Z+i1db7k/awFc/Xr0WJR+/eevYkTgAGrAKZLj0zITT/tya2kH+PCEVY8Epc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvXBnZ3T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvXBnZ3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6261F000E9;
	Tue, 25 Aug 2026 21:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693661;
	bh=nMNftOhcmU7D2DenVVoKjcg1s5faL2MyrxSqz1zA60E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hvXBnZ3TDqCbXXhOuqiDH+R900HLU3YHJmydfuyJm0+5nO1TcKi6oCYy/1Ro52zmN
	 pagScVNa1/9n6R2Tvzz4dBcSsDF8UaG+aQOwSkEU6KDA5kEMxvLuWyKidP01Sey+kY
	 q+EQM3VMZL5zQGIaWe8XhzjbR1o1+2aV0c+FS+Ieo3iKRDemDUdt0pG41/lqWqXl2n
	 DvTMRVng/pRt2GwYhaUa3KUCa3jeKpChMBkb+XdW9OLvaDa1hr55cNS6GR9H0QwZ+3
	 w5gUfdwXzQPX354jPIlL+7g69/80c2t294xaLeWhi02W9bQMuwAhCmI9NpyZK+O9Yi
	 42UAoBnuBsYsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56D943924A57;
	Tue, 25 Aug 2026 21:33:29 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260825201428.925639-1-andersson@kernel.org>
References: <20260825201428.925639-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260825201428.925639-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.3
X-PR-Tracked-Commit-Id: bb840ea69347aff7bde5a208e7b5b180669a7656
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc710de0dd25ed50a087833b4171eb1a46737a9e
Message-Id: <178769360790.4118109.4145052158016050642.pr-tracker-bot@kernel.org>
Date: Tue, 25 Aug 2026 21:33:27 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Ben Levinsky <ben.levinsky@amd.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Tanmay Shah <tanmay.shah@amd.com>, Ananthu C V <ananthu.cv@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, Bhargav Joshi <j.bhargav.u@gmail.com>, Felix Gu <gu_0233@qq.com>, Johan Hovold <johan@kernel.org>, Pan Chuang <panchuang@vivo.com>, Rob Herring <robh@kernel.org>, Uday Khare <udaykhare77@gmail.com>, Val Packett <val@packett.cool>, Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, Yijie Yang <yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Aug 2026 15:14:28 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc710de0dd25ed50a087833b4171eb1a46737a9e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
