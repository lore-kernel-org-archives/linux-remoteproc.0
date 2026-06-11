Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFBB2C15B0;
	Thu, 11 Jun 2026 01:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142479; cv=none; b=XWJzgf1SdVi3tinRCa6pKU8fh7PqTeACS4ea55SDGAzfIDBYlKDbSIOXBtTDm0K/0PxK1cbiwvVjqLH0s68d3tLo+QFySQ3M28QO7ey42a5XJmqX00DTfcQ36yzTDHUi9+G9X1hNDcQ6tKLdncby03CkHy5Xi4bDXFwS6oe0Sdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142479; c=relaxed/simple;
	bh=dzBk7prgTeHurgs0Yq8Z9Rgbj3Uhnq1b24s1GJ/YfS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooOhcZEiBqkS1jO3Q886XNCs3ARf3VLspWdfVhg5YFOKOXhOZBscd/5CMLL42nh/HypjJCtomngTbeTDL8zfnyAr/nGFJ4SikO5nLCfZE/BQI1d47AWKx4H2iHAizs64S8IvKKUmZTlfwRFXEyJYJwnpvj/lkFqbR+kqTVyGDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdKUn2DX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdKUn2DX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B981F00899;
	Thu, 11 Jun 2026 01:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142478;
	bh=un34XBgT0G3YiBTAlZ+qrAEFJFzAbCGVvZ1t/TnRfVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YdKUn2DX4sZeGjPjKUlrmOpTlWrvQgnA5V4ts5thBZrZTyHjx1UV5LJS/e09cmIco
	 NeVCLEetr4HxKRclBJ5yLIBbLz3UghOoeYk/14Z0aZ1PKlHi1l8RnkjgxxQVOa40CX
	 fFVIwOiayJ3X+kbpTMGKAt313FaAIp9U14NAPcLkPxRkQTuhUIZY1O5k5dmRkXLrjq
	 R98MyTPQz1HzJheTxpgXZUuvbDLhMDsoVSUzlxN+b28ODG6LRxYdszPrunPdiRAiXM
	 PLidYtypey3yBYFs//myJprgxVTsLLzKuPBVphr1R3RhIjfgJwnuklRAJVVVnrCVEW
	 pWccQQ0xKuyaA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Andy Gross <agross@codeaurora.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFT v2] hwspinlock: qcom: avoid uninitialized struct members
Date: Wed, 10 Jun 2026 20:47:47 -0500
Message-ID: <178114245720.590736.6389542077403038558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
References: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 May 2026 11:13:03 +0200, Wolfram Sang wrote:
> The reg_field is allocated on stack, so using the REG_FIELD macro will
> ensure that unused members do not have uninitialized values.
> 
> 

Applied, thanks!

[1/1] hwspinlock: qcom: avoid uninitialized struct members
      commit: 8752c396ce3b2136b3d4c906fe103f6efb6782d9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
