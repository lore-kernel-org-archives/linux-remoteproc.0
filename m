Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6752F8E87;
	Tue, 28 Jul 2026 02:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204305; cv=none; b=r/sLHE5u8UMGfi7KX3+Pw01WoA3WACxk0TiX3hCB5lgrSpaFCUa0upULzqN3Y8qstt7rsaOEhJm1Nb4RD30Nu/2DVlX4dSRBcDjk1mJIfC+wy4SbaZ1sozvM6LdzjLN8Vr4YwOAqKhf/BwpEqUIANtdjhSWdGIbP4Y8qPZPF0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204305; c=relaxed/simple;
	bh=vVWnhL+7iTAXTricay+MnxaeDO0crUjen9I1YT0Tfvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAfnZaq2JemaAiOQHv77vBclyi9hemByqKbmqfyy7ZPYj0roGYU/DQDcq1kKo2dgkgMoVlfwzIq6y3fDEMDgq2iQpkh2WfTj1bHYaumXZO0u2lWaT9UxlJkzcmYU2+3HBTIzkzGmvvqv9Wx9CWILNVHqQgOrMBahPipXUMotd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3LTmPjs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3LTmPjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798A41F00A3F;
	Tue, 28 Jul 2026 02:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785204304;
	bh=UFgFgrscAmYmLP8WQZqxO6fOpPfEM0msbDKCn0XzwOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d3LTmPjswXeH44F7OzQftXD4B97ZWyMgTikb+IJcrxWD1oG2QSmPZm+G6scwGIec8
	 tI1m3x9bfau0CKob3BnTloNkAywGEtoYvg+ii1W0CPRwiG2Zx+MAI0HyXx1fQyEfIY
	 o53zERf8wTnwDOwnzNkDrEw0XUA/M54LE54dU42W6jvVtvjxHrJKzQAU4mx9jzuejl
	 l0e7xRTAGEkVRNyBvAOfM5MpHk1fkbbiGYvrqXOXBbDXy/iXGIDp1WslaCFOKDQJE1
	 +8fKfEJ6iimdji7Esg97/sHiJsYp8HVNWeV4UNs5UxDw3AaObuKIvxvSnm7ajfWhiX
	 3WT5nSqj5E/nA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Request shutdown if crash is triggered host-side
Date: Mon, 27 Jul 2026 21:04:58 -0500
Message-ID: <178520429370.31699.12850810576633181831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
References: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 03:00:41 +0000, Bjorn Andersson wrote:
> rpmsg client drivers are allowed to invoke rproc_report_crash() on their
> grandparent when they determine that the otherwise seemingly healthy
> remoteproc has entered a functionally broken state.
> 
> In the crash handling path qcom_q6v5_request_stop() is invoked, which is
> based on the current rproc state whether to request a graceful shutdown.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: q6v5: Request shutdown if crash is triggered host-side
      commit: 0ea50486978f109e6d4c32267fab01ed654a2160

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
