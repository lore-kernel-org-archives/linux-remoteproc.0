Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD37139CE3;
	Sun, 30 Mar 2025 02:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743302308; cv=none; b=p6f0OdmTASwuGueAykgwxTuRycT0u1kHwvsRArzn2Q2V0TqI7biCYbn2Ikjp1u7Z03zCcJcE+1i/WtHyge9JcIDGoJse/7rdE7vl70oEnIqHS+94wKxsy4QCNC5cyqUSKDGaH0BVAzNWiDyqciyMv3XgzOFvLJwUnf4cGYbZ09s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743302308; c=relaxed/simple;
	bh=kOxnt59c4ie/8wv+/lsLZkjHKM6Vx2Q+BUEXRJRA1jI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ijVdDRTe+mmoOT4rBfTTqSgiz+X6BDqw5xTmkuDOTOSzlaBw/Up6ombq9DllixGl7IMtnpg+7nfIwKc45HaVuO/q/h43tUYJb6VM6RVhLvuZPBl0ijlyyiS0hmyauw+AMvN1VVV7ZFsPfGsCKP1kANO0B/9Jd5pyB6n96ouYpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qroOcn/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qroOcn/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C52C4CEE2;
	Sun, 30 Mar 2025 02:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302308;
	bh=kOxnt59c4ie/8wv+/lsLZkjHKM6Vx2Q+BUEXRJRA1jI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qroOcn/EK+WnPsxIVrySZVu51tRanGoBbg0OrrqyF+oaKorxzNTV3+UmjZbq7d8sl
	 MR1V9I8k8UVNbntoXOnGkvpye4DyRANznrsYNN2r4QbEyh7iqhEFV369La8cShWSwg
	 wdlOVfFl3V6bKGIE8vnR9+dujECJCKmlk5C/ytVqrIZI/ls1k5LZHCLTccH4qYosLW
	 YbfjgFDDN71TJvlt9rPxbhV1lvqiS2uIN6+hKNkfeOocxHd6b7v4ViVTF6EoLwuh5b
	 x20ViKxIWOOr8dnMrHG11Flrb5gBHYRRlOMZaKU/2tIDH3r+xph4URsNGrsh+LePWj
	 PzrBY9JSpu2Ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BF9380AA7A;
	Sun, 30 Mar 2025 02:39:06 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328192607.188729-1-andersson@kernel.org>
References: <20250328192607.188729-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328192607.188729-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.15
X-PR-Tracked-Commit-Id: e917b73234b02aa4966325e7380d2559bf127ba9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 472863ab2aca6f4d2b7db828f77c36c5d1f43d9a
Message-Id: <174330234490.3338213.11952550087100065727.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 02:39:04 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, Luca Weiss <luca@lucaweiss.eu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 14:26:04 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/472863ab2aca6f4d2b7db828f77c36c5d1f43d9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
