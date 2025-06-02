Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869E228CB8;
	Mon,  2 Jun 2025 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891843; cv=none; b=cSd/tNxTmwaJOH7NKoakPXskrbu9oVs1IoJZbofaL5JWMkjmI2z+aNRReL2CVhcYiEeQhrxt3kWoe6oQu6qy+n+j+H8UtHjOZZAo4tfDuaPUZFbYVCd0XsXmcQAc+Bk7YkMH8MRm9X3kT6kCPzW3hwMF/pP5C5YUv4GJuj271G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891843; c=relaxed/simple;
	bh=lEf460NZudzPaFxmO4RFcmfGTyhfIcEnCl1dheqCkBc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ql3Dq1dEKV2hJHZO/7QYxMffZr8+3xnxST2J92G+MTdMqOiPI3mwGZWqxXySLTbyPGF0FTjh5/PEfmZ/9ZyDNPrBDZjVMKYqRYum4VhOYmMortOCeMrhP4Q/4hyKxxewoNGeT0fbUZCyo+etnCArmneLlDGNZyt5dDvXZTpbALw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bx1cdUwc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bx1cdUwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CA9C4CEEB;
	Mon,  2 Jun 2025 19:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748891843;
	bh=lEf460NZudzPaFxmO4RFcmfGTyhfIcEnCl1dheqCkBc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bx1cdUwc1/AQR8XEysAhTOECNyUUfTPt+7cKrzPdUBuoeu4mN8ik5OxWAmWgcxjSf
	 qc+Km/6c1/9MPBOsxlqgp6nqAhzzK2CYNOowMeiE1SNG8yymFUNRKyd8V+yDj2LEzr
	 8TDwF2a9Wx/dw/PJqCGl18vwYaYYgQZkBrUAkF3js80Iy1h4lg1jWiVmiQ5v6lC1y4
	 dr6bHxfGU2TFWya0GJCX2QCTCZ+fqaJGcRqAHKtVmMVXyvXg44Bjzd8C3+LN+xRhIk
	 D733waho+kixJx6cBu4Ar+mM37LR7028Rqh9XJtxQnAe5MIOgCYl7qOn+vmGRTesnt
	 Se1G9dlP5Nilg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D2C380AAD0;
	Mon,  2 Jun 2025 19:17:57 +0000 (UTC)
Subject: Re: [GIT PULL] remoteproc updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250602153710.3447-1-andersson@kernel.org>
References: <20250602153710.3447-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250602153710.3447-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.16
X-PR-Tracked-Commit-Id: 5779f6f9a64ffc3e002a37ab1f78521d9a5c0100
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dcf9ee9ac4d5c09c5bc74aba5e93581e93a1ac33
Message-Id: <174889187581.877155.9237954879953235201.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 19:17:55 +0000
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Beleswar Padhi <b-padhi@ti.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, Xiaolei Wang <xiaolei.wang@windriver.com>, Dan Carpenter <dan.carpenter@linaro.org>, Iuliana Prodan <iuliana.prodan@nxp.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tanmay Shah <tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  2 Jun 2025 10:37:09 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dcf9ee9ac4d5c09c5bc74aba5e93581e93a1ac33

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
