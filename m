Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B323F4830
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146910; cv=none; b=hqhkDlnf29mOFuZXqGRh9j9mWGYdKoXjDyvvcjqwJd3oWaSsCmgjXPmtoT38H9/XZK6cZUcyuko/iolqdQIbYW0MetLFqDcfkQJ+j2jdjNDCN2WME7sbLf3H/HDR+ACSAaH6ih/G4oaTMHmaE3zAdP4z/C36LMKh8r1WYNf4YhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146910; c=relaxed/simple;
	bh=7OYcwLFmLMhfpEbbyhdjyvs7JCafH/TkCASHfkCOjNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWPg0g7vJqRRpHjDUO71Qt7PT4pMnCMUNlT0qqKliFMYNODM4eRiKqBsVHlarzkY/2KGNnTpNgy65vQgiUXmnkQGF5cp1/w6MPR9L1qwEu2K2V10/3Pbyp31G56Wa8l//BO8CgU5Dqp6jJPx3Guiy1AEDv5t7FiNF4jzXnCozLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GhiPZDgH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GhiPZDgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7OYc
	wLFmLMhfpEbbyhdjyvs7JCafH/TkCASHfkCOjNY=; b=GhiPZDgHa0rJP77G0ZFK
	K21HzOugq2/2rSfT8rh+Daj7+r2L55roqG+bDabrgj9rHnECK7bbBINNG0PBX8JS
	Gwmb9lqCUeuDN4G2JlBCyZebxA1qFMv0NUw4MxhdL/QDnGoJub0INT04wAUlMmaz
	83W3h7t0ANduYglHAAyMFX+NX6Hh1Zp6VaqPv97JCB4sumtP1lmfTb+4Rk9jCVUL
	2m2vWShCbxjTqhN59zJUgdTpDKLAaKFM9m91e1iYxlTqPILfC3GLGppj8IYcbcG4
	dw/QiENphWfbJLPbp7T2PeaxfHmI0FkzO65QvuM0rzHFW6uW5PnolYfAw+TQgmbn
	Ug==
Received: (qmail 564783 invoked from network); 27 Jul 2026 12:08:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2026 12:08:26 +0200
X-UD-Smtp-Session: l3s3148p1@LLY255RXWsEujnuy
Date: Mon, 27 Jul 2026 12:08:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 3/3] hwspinlock: add low level debug capabilities
Message-ID: <amcuGljqzfdzJvge@ninjato>
References: <20260726214219.17703-5-wsa+renesas@sang-engineering.com>
 <20260726214219.17703-8-wsa+renesas@sang-engineering.com>
 <amcQvjpxQHzUNrIx@ninjato>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcQvjpxQHzUNrIx@ninjato>


> Bummer, I was quite sure to have used hwspin_trylock_raw already here.

Ah, I used the raw variants in fops_trylock_raw_set() and
fops_unlock_raw_set() but not the test function. Mea culpa!

