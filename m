Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CE37C0E1;
	Fri, 10 Jul 2026 18:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706842; cv=none; b=owXRJAgBuXs4YI7L0ZJnQj3mgIgPdwdNQhjpKZpAHZ7aw6oerVibTsJ7sUepyNTGW5+f0SzpsUTdcFjZnQ6PTnhIu6To1xHbtkh26IULYW0+t6CKySvLs7UBP97ZGm1owT9Sl5mAhvj4fX8BuffEpFaYiPDLZxoW1l+92x6LpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706842; c=relaxed/simple;
	bh=tnw7FAdtaAybU6L4IAEPAISIrMlltfpeStH7YQBdL4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWQzzkptznOgoQWzaFh6TZ2+3x5NxMt9S6xAYRwH+WYbh6t//lEK4U44zggv9NidU3sTdE0n6wbiai2xhFwykYOO0Xc3HBKTgVZPOupwMShJvkToWmu0EGK94YSuwlKEiMyDvKcfJT2NrW8xToP4JcqEsrupflujYpPANQiQ4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKV2WcTv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKV2WcTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5CE1F000E9;
	Fri, 10 Jul 2026 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706841;
	bh=IDASqxy4pZTBIbj9QbK6E3ArCs4zatN5FPTCPmPK/3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BKV2WcTvjwD1qc7gVRmSJNrvvJcJ7MUEoVRI820cOQdPqmoRPhU2pWGTAF1d0NLyy
	 QR5pTK+Siujr2NFWObyKM3LQ3C8BeCQWoDd8GxYpIlQZiTUzQVAGQbRjXkPzauhkqR
	 AvlxQ+mkFkvQwPclpZhzF+Q61y1njEMPraHSqIF4a43D8g4MjO775+SDEj5EHazw5Z
	 RIhUY1CQMr/ayXP8o5kqnsO+BaHEJNWgfqRgGgYcfxtZOc2OM3xVVT69b+WOUqJZZ8
	 A/ocsvAsX/Gyp0I4M/t2+e0DWaYcIQpvBrKK3Qnh6R0kkMeIPy6CCzNJSIBWVk3li0
	 xt5GeikEbB+AA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem control instance ID
Date: Fri, 10 Jul 2026 13:07:05 -0500
Message-ID: <178370682990.2572738.16410202237322359346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Jul 2026 17:37:15 +0200, Stephan Gerhold wrote:
> Currently, trying to shutdown the modem firmware on MDM9607 results in the
> following error:
> 
>   qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service
> 
> This is because qcom_q6v5_mss defines the wrong instance ID for the QMI
> subsystem control service of the modem firmware. Make this configurable per
> platform and fix the issue by defining the correct ssctl_id for MDM9607.
> 
> [...]

Applied, thanks!

[1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id configurable per platform
      commit: b19a43659ae4d34479ba2194961353827e659367
[2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem control instance ID
      commit: 4684c0491387814a2a7ebad55fc0f387dd4d4f69

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
