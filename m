Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45F782D66;
	Wed, 27 Nov 2024 02:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732675282; cv=none; b=fjuGudabbIFokn8Q71l7l3EqGtCSg9+G+ioq/MgvoOd4kOs0admQD7rRqJLKCCczLQKTxmo2eFVRqlgAPjvegaoqdqjGTi3n6qf/yEQWZSkXaK508kTeQv32jjZGt2HZcta6bRaK2pp/lCwbDuhOgagkrWrUqoNg6br/hp7RITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732675282; c=relaxed/simple;
	bh=MjrzOZ5qOayNLu17pibG9QP+tEf6/+lSIPTg+/coqnE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PDtt86jPRNDFUFgGWmAHhR2cTP5kphR/kYTZZ2koOhddib6YJKUqKxghwnFYoYcw8k+iLFFCErrQmg8sctn8ixVgnRQ4iVD1qr3aJFN0y+mu3EsaVJS9UBwfiGNKgycJIYe7QxdOPZeijLkqY203JHQ8dyeqc1zUoQ6+kiABSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsRZ5HJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsRZ5HJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D66C4CECF;
	Wed, 27 Nov 2024 02:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732675282;
	bh=MjrzOZ5qOayNLu17pibG9QP+tEf6/+lSIPTg+/coqnE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GsRZ5HJksVQGrh9NoECgB4wU/5wEKsS/t6F9P9TtWi15scIieB7Cwl694wc5jh9nc
	 sUgx8qBy386VZX9S8Abk6SNorXRQKAqNCFCFrBME6sVvmV5zrWwLVs50IIWqUAO/vO
	 XIqzGL/F15r2z936U5enkFGgp0bdtX7UXMhG5nQLNRtu5rJVfpKChu5fs7tHq4x57s
	 bbglrf64x1yD1mwYqdmUJ66WJd8XZSHOW28ovEcOdnC3LrA5BxAFgUAysPsuTaMTRf
	 6NinZGPO8nG371OpJ20pxXyW6SH3tiN2VxlJHv81KeuxNMchVd8OQCpR8nQRqN1ViU
	 1lfdVmYX6ML8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713C83809A00;
	Wed, 27 Nov 2024 02:41:36 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241126160536.3286933-1-andersson@kernel.org>
References: <20241126160536.3286933-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241126160536.3286933-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.13
X-PR-Tracked-Commit-Id: 44024ebf25918efb8c771e1b496250bc9c4ef893
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 08906abc8c6e3a64f7d02965b657a3c6c159cd96
Message-Id: <173267529497.617991.2556527177710520329.pr-tracker-bot@kernel.org>
Date: Wed, 27 Nov 2024 02:41:34 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Davis <afd@ti.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Arnd Bergmann <arnd@arndb.de>, Balaji Pothunoori <quic_bpothuno@quicinc.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Lu Baolu <baolu.lu@linux.intel.com>, Markus Elfring <elfring@users.sourceforge.net>, Sibi Sankar <quic_sibis@quicinc.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Yuesong Li <liyuesong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 26 Nov 2024 08:05:20 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/08906abc8c6e3a64f7d02965b657a3c6c159cd96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
