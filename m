Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5E54DAE6;
	Tue, 22 Sep 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098613; cv=none; b=AafSb6mLh2pJjgmlEiuzpaRylbc4POx6CrJiTQAYaJQ5KzmmL7fAjqKC1uMyF3T35D7YKb1i2m59DQYnQIFkHTARJDjCFRmkiccqMXY5J3NjipKwNradNf/wzhm94z/Ve3gSxbJLm6EJJNX+yksx1l7C5+jlDR7ckNr5KLaZ+us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098613; c=relaxed/simple;
	bh=qkopl1LmNrmknlznlDOKlSLOSpUFspeZRGI572gCRAs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=EwgrMA/y/29VL674qM7GiEYoVqr7spwT5krXRPn6pqmy0hJu6zuuBqiTGJnBKFUbHEHP/6+daPemWLAs/iZ5Q0OvdZ4GUHUH+cflGvLAbUGWweVwDsK4XBbX3Oj+2zEIVsuerOKbGq/BUnLhVqe02tKI4LYFc0IZfqRONqAgiYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmsXgfRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmsXgfRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAAD1F000FF;
	Tue, 22 Sep 2026 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790098611;
	bh=g+NnfGAreMlnWdPFKrc3Fs+66ktV/mC5/nzEN/1tuoU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BmsXgfRsMx58sdMrXeiCRBz2C54ODC7ufIfzZjnFbCjcnlWi137aPDjvqgKVnYjXd
	 V3HZo/NCEByKVRA6KOjr3I3LROo5/fbEILVPgvXpkdxIn0DjuG4w0n9yyeAQsMMn0h
	 9t/UUNhjS0y+BRocbQdIt/ZPW2mBFlS6PM5dlEu2EtywpTJdykq+1t+/2vdveGRjfd
	 QGA/dX2uZeNbIuSuPsyR4KnVJJd/3eN7yksOkDEhmjElEIg8RDhyxdSAx755jM0HFr
	 v/SU1xZLeHP4CO40et733N053zC6ram7F5J6M97usGC2WDP2/bGGbDAoYslOkdVlqD
	 dTeR+N3eKIQXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93FF73811A57;
	Tue, 22 Sep 2026 17:35:43 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc fixes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260922021622.321847-1-andersson@kernel.org>
References: <20260922021622.321847-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260922021622.321847-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.3-fixes
X-PR-Tracked-Commit-Id: 9db31edf92dde1f3c98008bd5f88e859d14324cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 34e34736ea9a685664f57586f6e293aaff308858
Message-Id: <179009854225.10467.2142500951616451400.pr-tracker-bot@kernel.org>
Date: Tue, 22 Sep 2026 17:35:42 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Paul Hollinsky <phollinsky@holtechnik.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 21 Sep 2026 21:16:21 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/34e34736ea9a685664f57586f6e293aaff308858

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
