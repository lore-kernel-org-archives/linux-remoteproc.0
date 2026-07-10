Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C64237B02A;
	Fri, 10 Jul 2026 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706842; cv=none; b=Ya71i8BNBDHvIYBcZccxOte5sJNxvw4mkvz5ujNxGfrmcdvB5Ig0QxyDTMFbVqtKxsDj5dN7tqYT1I5ZSNoe32AjIDlKEP9efCUhim5fNwAfJ+npDzEc4aH9QQajyPD1VJRZid33U+9oHNnWqwftnirPrW/vOWjQ76BALveoKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706842; c=relaxed/simple;
	bh=zLlLtGqM5kZi/yUj67BZ8ym4FZneLEW0zBCsIQ0AwBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ESkEMsJ5Pa7qlszp0M6zJbD46p1/vdnOWWqtmuFgdeSa+7DZ+R3E9XpMexXp5MDicso2F6GuP+3bQdsx/3m3f03fPi+POUEj/W9H7iCW/1Y6tWKC/ANoU2lu3FsfSmWhpaHEdHHHwlCPHuxJVQ1mzw+ofUUojN3MiEMEi1loZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IV1PZMjJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV1PZMjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9489D1F00A3D;
	Fri, 10 Jul 2026 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706839;
	bh=HTeLPwNT+3eYtMl0rglQcLRXHXnXb/KMRHv1ZAOiZ1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IV1PZMjJN2YwOd6I40Np0bczcLKWDOws7Hy6+CT0fjZsNwQyNUdFVPxmoGKreh27j
	 XNSaFZcIPBAi84OyvfYopEFgBFJjTCSp0pa9s9XSmRtuT+XYMIUuGg/bcTSw35O1Dj
	 ytp/+1vk3eFa7+cLXZJUTZY7p4aMw1oFM8j+vR4K58HFDthCnJpdQKXOcJptx7T0H3
	 vdICNowSVqIYhQh+RpxIcrFnVBueiw5QOCM3UAzZIwfcvsDBS74reFY00YZDP8fUWi
	 F3boIvHlFihNsrnbSIfIaOI1pWsxcD8MbBvMupMCmBnMhBcGPwrNnZ4WJQfFHgDat3
	 2kEI9H2/RNqSQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] remoteproc: improve robustness for rproc_attach fail cases
Date: Fri, 10 Jul 2026 13:07:03 -0500
Message-ID: <178370682994.2572738.15619840157741014627.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
References: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jun 2026 02:05:33 -0700, Jingyi Wang wrote:
> Failure in rproc_attach() path can cause issues like NULL pointer
> dereference when doing recovery and rproc_add() fail, improve the
> robustness for rproc_attach fail cases.
> 
> 

Applied, thanks!

[1/3] remoteproc: core: Attach rproc asynchronously in rproc_add() path via schedule_work()
      commit: 4aaf30e2b0319ba6b147191f6d2bd856c16a51ba
[2/3] remoteproc: qcom: Check subdev start status in rproc_stop()
      commit: a1aac0756a91193dfc50baf7b52bb4ee0ba91759
[3/3] remoteproc: core: cancel crash_handler work in rproc_add() error path
      commit: 573e7e135ea28716008083c311db7994b4d72191

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
