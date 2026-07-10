Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C537A4BA;
	Fri, 10 Jul 2026 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706839; cv=none; b=WCP4z37IfdgtF3+66UCIeC69VjzV+JJa8G7mtCtfR51ExR9dkzBIGS6t9Xeo3nNa8JEUkO1JSW55N/ydsQNXZetHHkFjxkKeatMZhLkGQZ2trbFzMxccCKaRCHthggIzLQImfDZosZ+RYU1TavOJ45o5U4LVMgoGnwga7Xo02RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706839; c=relaxed/simple;
	bh=OewsRjf3CGggG4CewaeIduIvkPmSKet6AVZlk/Xx93I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gdV2cZ4KGjTFfuhGbAxcLsvyPbFX1dyCivr7fLWFZmZPXue6jRMGUl6Si7VLLs1f9iLvWAK4hi0CNIng5Hrho9uTjZA7y8U8SPzM8Cq/VK2wLUI3cqcWZuTnr7WUgEC0W6b8/2TkPBTPwClczW6aTPngTWa1xs1wGDM7hOeYM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPxLrC+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPxLrC+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CE61F00ACA;
	Fri, 10 Jul 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706837;
	bh=UkFaimIiDuvVg5QqfDDDVkiPIUpMQHaNcCeDNhAHTm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BPxLrC+Ime/SQVaGgKwtVeyAQnVQQde2kS0zyMdfagX+iFjuIjde7h2LRYP16o543
	 3M0Pyor2/8g2+9T/hAv0D0VmKQoYkuGi+sj8e8RJ14HP6hVqAnNKQYDsFh5CsnysUg
	 6OgJmpZwC64XhBX+apwHhxJaRYXOJQBXF+FNHx3B7q83RvVsoy1xTvf+l6aWd3Ikli
	 Lf9CWPdDsVjNwQa37+I0KOYIXdJd20ZGLh4ivWzF2LyCyacSjHxUMaCzTdT0hL6s8i
	 fzAvap2otMnxNrly848WUmJH3le3sMtk442MSnIntaB+uRZMtu7afTZAiWIlgCUdT3
	 nG8eL5QDQq/3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] MAINTAINERS: Update remoteproc repo url for hwspinlock
Date: Fri, 10 Jul 2026 13:07:01 -0500
Message-ID: <178370682983.2572738.3929834953378902501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314170151.18319-1-antonio.borneo@foss.st.com>
References: <20260314170151.18319-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 14 Mar 2026 18:01:51 +0100, Antonio Borneo wrote:
> Since 2021, the remoteproc repo is not hosted anymore in Bjorn's
> personal namespace, but commit cc73f503f7ec ("MAINTAINERS: Update
> remoteproc repo url") only updated the url for remoteproc and
> rpmsg in MAINTAINERS file.
> The old repository is still accessible, but it's not updated since
> 2021 and is not anymore listed in https://git.kernel.org/ .
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Update remoteproc repo url for hwspinlock
      commit: 014be5698ed0645f1d5263b354c27fc3ba77b281

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
