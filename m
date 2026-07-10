Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD3233D9E;
	Fri, 10 Jul 2026 18:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706846; cv=none; b=DPbirMRPd0EfFxypeOUIntThSU6SkOICV/IlxwWX5f93+knZRyFgWUuA1I/wS6RXd1lc3C4ZUJnLiHBljFqnCQMHgQOHsvwqBHpO55IL7ZIR28FwtnBuHoFfg6bvILMOpJtM5yxRqkypvZEYKKSK5cAWo4wZ15fJbXD88OW2oaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706846; c=relaxed/simple;
	bh=w1oOzUgiUQPXYy3SofXoxAqDEEtFQFAe7W79zy10r+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qiXAlP9F0YqqqWNNdci0E6W7n7pmHb1NPq+iCC+WowTm3+Vsrh1O3RaQaHFDMw6NHdFcb+vamVeHfeYcaVqkpYjoQ4R7kkuSVGF0yv3BN/5DLWk9dtEoSouiHFuJtxXymIokCs2rr04OleYfRCWyOXARTp/L2eXFDu8VJSkSjw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBrCvt+5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBrCvt+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA1E1F00A3A;
	Fri, 10 Jul 2026 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706844;
	bh=v4hTSXpz/g4Rq0ck6FVl5vTd241lb/PScfMRg3d8FFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NBrCvt+5Iiv/2AFmV2+KxKbGxBkl0TrZhENKAqZuvHQr4viJRJhw+sALCWO8sQl37
	 1aHf+PSaYMsqddi2tQ5HMMpI0ONt7x+hXcbiys2VyCyNYJkdXeNQeIsKs6sfmajaKq
	 wwkdqT96AWw4804JCwSCU60BOtuDhc4toaSdSSMOrh+B3NotMRyqo+9GSkq1MOHQvd
	 J1QiXcHPm1Wo536VvBl7XwenYOIvis6XLBlK7xwMtapBFQ1tLM1Xp+e1t3lWh4Rwvq
	 9FruilzvirTwngNeFKyZxxEtvcIao4lDwTvpkV4x/EcYMjKqIYPsBboZsXjJjjuwai
	 wcGyDC+KOWxmQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	deepak.singh@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Subject: Re: [PATCH] rpmsg: glink: Replace strcpy() with strscpy()
Date: Fri, 10 Jul 2026 13:07:09 -0500
Message-ID: <178370682976.2572738.17769908949059020506.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
References: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Dec 2025 14:18:34 +0530, Vishnu Santhosh wrote:
> Replace strcpy() with the safer strscpy() to address unsafe API
> usage warnings[1] from static analysis tools, as strcpy() performs
> no bounds checking on the destination buffer.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> 
> 
> [...]

Applied, thanks!

[1/1] rpmsg: glink: Replace strcpy() with strscpy()
      commit: ad6d7795388dbfc8a4c8980b49ad43648b1d6efe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
