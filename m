Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363B36167B;
	Wed,  5 Aug 2026 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900884; cv=none; b=oSXtYCRqlML5fdwye/v7kjrJPrbld20U7x87hqsVCMw8jcpsSNL4+Ao1REiAZI8ffNq5cfwTF25AVN78oUvFUTkWak04wHUEyyK9VXn2jbAO29L+3GUYGNxL/VnB2ByffEevoI59flfuIVEtrLg94mCAa2u/9cvh58dBcf5gik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900884; c=relaxed/simple;
	bh=YomxDnQvrOZHACzdJPPTb0Xgjl5Rvi0n5TX2XNoTAbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzbfkH17FmfMGkAJoibcIe5IJ/9Dm8NStf/QVlbBOvQBtGR0EiicU/GtfUbiA05bCaiTpgjdR8oH99YwuZtmQFOlQmrCpK6PU84FgDNnvjFqDZA5oZcsayGp5avRGrZRD6O4GUZU95kFuEbBVRqZiVXX2Ewo1V0H4vq1AAbbI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1RS8uHe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1RS8uHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EBA1F000E9;
	Wed,  5 Aug 2026 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785900882;
	bh=VTpSfLNumSoqLwGxOMiaXBblUQIarcv5sDNPHm85AtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G1RS8uHe4YbpPFYuGxwKSZh/AqzJ7GtblYzjtOG+YDPrjR87TsjJy42GP03CgqJ1K
	 0lrViYtmQrSmc+O5+EbMjoN3siqvLzhBEvHT12GZgTRceN0DLDfqQc4pox5Qx0L0bS
	 gCIvXAoEzIMwkYg5ZQ9RMZzEpYuFagyBldFk3f7/+yngxAjnpw+kYKkfd7yHwjJS10
	 iG+Q5IdP/itHetHTR1mEXKku2UJVpTv9TvfmxCCsvZSxWHme1hTThA45iHIkk/Nl0k
	 1m9MRMClpUyQyPExDmdyyhP4gzlNUZ+RrOBUTlMGMK1NecnX8/J57MnH2Qe50uoZ/J
	 Mq6x0yGvGHfkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 0/5] remoteproc: Misc. RSC table changes
Date: Tue,  4 Aug 2026 22:34:39 -0500
Message-ID: <178590087572.459445.17756435651859779909.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Aug 2026 17:13:26 +0530, Mukesh Ojha wrote:
> This series contains a mix of header hygiene and a security fix for
> rsc_table_for_each_entry().
> 
> Patch 1 adds rsc_table.h to the REMOTEPROC MAINTAINERS entry, which was
> missing since the header was split out from remoteproc.h.
> 
> Patches 2-4 clean up remoteproc.h and rsc_table.h: a checkpatch style
> fix for function pointer alignment and two SPDX-License-Identifier
> conversions replacing the verbose BSD-3-Clause blurb.
> 
> [...]

Applied, thanks!

[1/5] MAINTAINERS: add rsc_table.h to remoteproc entry
      commit: b08aeb36957e7a6bd1afc3802a82c3be52066aba
[2/5] remoteproc: fix coding style issues in remoteproc.h
      commit: bcacae90e8c1a2be0716895dda663fb5fdf9f85e
[3/5] remoteproc: replace BSD blurb with SPDX identifier in remoteproc.h
      commit: 7c1f35380d22971572856be8642fb46de6229d94
[4/5] remoteproc: replace BSD blurb with SPDX identifier in rsc_table.h
      commit: bf9053b22ccbb4d481135d0000fac7302d060af0
[5/5] remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry()
      commit: bb840ea69347aff7bde5a208e7b5b180669a7656

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
