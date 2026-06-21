Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2D25B090;
	Sun, 21 Jun 2026 06:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782023918; cv=none; b=bil1W6krkt64eGwT4QmjThNbRjgCjz5cqHUkrNYiantk2uc2gdEcFKStBlrV9cfQ/l6QnfjtJE0VqpV4NzzvnMFuFCo/gx2LZkN3G4MI+3zR6CQKXjoUnySrX1s+GL/XHWgOVHnVX/sv32NkjEsM5X6+JT3O6Vk397DBtmYoeQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782023918; c=relaxed/simple;
	bh=jH8/n17oKluinf7VtzV1igh0dt39CFt6FGyGq67YYL4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=g8LWHzLrPbXUAx+0M3EVugPFbhgW30zSrZ1RP+uYGH8f2m5ht+WLnZtlh409SCsATzXEIlhCwpmLQ/NVT4qmf9/PZ4qszVUoCwVDBGHd7wUao8IVrGjs5v3/DkhvgaP+zi9IUHmtjXNPe+xIEQKIVIFdTcqqMHPAxjiogp2BAM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2NEfPQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2NEfPQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B23B1F000E9;
	Sun, 21 Jun 2026 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782023917;
	bh=GrrcxfsbU6go4hRuq0ZYiCv3c8yThvUs6kvAcs/ybkw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=j2NEfPQXPJOgSqouosfkk13b1FSRPLN4hsXd3kWpdGJRd76P13mf9VycJUyqD2JWx
	 crudNVB8tu7+0m0PV1qkC4XGd7Y7YXJPXi1D7cBxDb3cCrGVQGj+Fnn4UCl0LEr8hh
	 lHQJNTLYLwGFC9qKSIgT+ExNbjVWdEicHog5PCYq8daEm/qvJS2DXytwk6z+zrHf6n
	 KSAXE5buO2XF3vNdPrQmkNMf3VTOtp9ddhNI1j2/io5BIabz+oksLaMu5QgVwI2c12
	 oBY5lXasamA8GxMcyu+oXgA/cGkNLx50j4RvuEDoR+LFaN1ERbjRqgwYfIQeJ+n/A/
	 XG4vyeh36xhdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1993D3AAA6D8;
	Sun, 21 Jun 2026 06:38:30 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg update for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260620143831.1112703-1-andersson@kernel.org>
References: <20260620143831.1112703-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260620143831.1112703-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.2
X-PR-Tracked-Commit-Id: 1ff3f528e67d20e2b1483dcaba899dc7832b2e6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c7f112e12de3098176e3c5eef022dd0eecfeeeba
Message-Id: <178202390861.305170.3315339232529967953.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jun 2026 06:38:28 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Yuho Choi <dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Jun 2026 09:38:31 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c7f112e12de3098176e3c5eef022dd0eecfeeeba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
