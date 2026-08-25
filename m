Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1546F497;
	Tue, 25 Aug 2026 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693664; cv=none; b=nPnTTWKm0jFGppRgqQltaHDFx+RmZV+mY8qOs8vQSzJ7SWTpKzdocrA/CBb+UjyOofIVL/NzBl1ogfw4rUAsdmc6QxQo47KWI+RM6Bo0tCVbTnXnXxln3P8eROw7P4QGeJoZYlEL5sTSs/BFciu9HXYb701TqgXSGdoReBZY6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693664; c=relaxed/simple;
	bh=4m6FvOZ+297LRPXtWLOF7kgSHTriwhe2dxPMrkbJ5QU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Bh748YRzq+72bR96WrCIKX+n2byRISMipyjwEOTX0THLaK0Wy1+ClP+DCe2AEUG4GULXh7KdT0Y7IwYLXcSBX8Kwfiddg69xhNrC9W9S1C7CzKJZ/QIsc0D5oakvo1cJUMcRheHbtyG8rrOb8CXGqBz1E1A+PW+ZjL107MoL+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BL9q0+K5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BL9q0+K5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1991F00A3A;
	Tue, 25 Aug 2026 21:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693663;
	bh=bkFapu+ppxcaV80DQpgq4GbZEtpxON4HsNOkLk2oUAQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BL9q0+K59dBSJiJWPzZM5yAx4AHIPJP1b/WJjOUteQsFBZ9a8Q0G7t5Dh2JVEwK7G
	 5Qm52jt9fg2O075UGrha3Y28pArIODfAO8TpOt1dvo7te6bRvnog4nAH1DOSwJLWax
	 IjYRfI2gdDXFnnDMStPaNpgAZH+3yFKtHTeG0DVMGXYM32v0AlAAaKjEsywouMm8hE
	 /WvAXLXvDncdzRiDG6fzJoKT/CGWyluc1NGvJxSa2TaI18m572B87HBGInZE5rzhnW
	 F5+mPpBwkuIiX1nx3l0TaX3iCW9VbnkOBYqQt4Hg2ZiMGjIMH7GJ3LrUU6t9oII35M
	 q/kajOcVQKEKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5687D3924A57;
	Tue, 25 Aug 2026 21:33:31 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260825201515.925724-1-andersson@kernel.org>
References: <20260825201515.925724-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260825201515.925724-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.3
X-PR-Tracked-Commit-Id: 786439ad58763e04b91bc2ec5f590e463939f197
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f2ed28dce9396b94097376643527112228c2eb83
Message-Id: <178769360997.4118109.2199086179661429222.pr-tracker-bot@kernel.org>
Date: Tue, 25 Aug 2026 21:33:29 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Chris Lew <christopher.lew@oss.qualcomm.com>, Chunkai Deng <chunkai.deng@oss.qualcomm.com>, Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Aug 2026 15:15:15 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f2ed28dce9396b94097376643527112228c2eb83

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
