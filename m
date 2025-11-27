Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB2C287507;
	Thu, 27 Nov 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764264900; cv=none; b=ZxhuZ6Sy8j8ka+a1f5FmX08174zfIsBZr7SXjVTVLr7Pl0S2Pxk6CzKtlR1kZ1eCLC5wjWIjU7jBVwTz99qaH2r6sxGtU80j07Chs7XchJXAFb/aUEAJx0mvugSoPbbw8ys/Y601TLueT8HPY+kLmN8s2zP//YYhuSylPIjRID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764264900; c=relaxed/simple;
	bh=pd4sWBjhGyBAhqcIh5yHkkfv4CzqpEXHV8dEXcF5orA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HvOa5j2i6ag5mk6ZQA9BpTBzT/xAQPekG+xYqcsHcXS6WpZs7HH32yvFHibEhXGi84HEnvcezHnxEzKDpIWVvV8YuxJOc10mcKJV+eUImJfodfRvFXirR+y31qc8e/zyI5YmJCGw0R3RFk8sBdBYXNdJhvb2jyqCgS8/BvHt5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 4FF65C025F;
	Thu, 27 Nov 2025 17:34:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id 5893520028;
	Thu, 27 Nov 2025 17:34:52 +0000 (UTC)
Message-ID: <0fe4a563da5316ef702d7c324d0820c8c2c224e7.camel@perches.com>
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning
 of kernel.h
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap
	 <rdunlap@infradead.org>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet
	 <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	 <lukas.bulwahn@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
Date: Thu, 27 Nov 2025 09:34:51 -0800
In-Reply-To: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 344bsnmdzy15ar8q1r6pickoc1cc6y58
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 5893520028
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+o7f9E/k+Gg9tj3EzpDyehYXDETyni91I=
X-HE-Tag: 1764264892-703371
X-HE-Meta: U2FsdGVkX1//RHplmvGyUg7soDe0LgkeR58Ct1KgzeWTQ+Dt442WGADpIVubJLE7vO8Yvts4vmbKhE7XUMvpl1o7tegNwWjLDBYjrmfnl1+CpmU4QJNHDgt6WnBDRb4gCiWyB4yFzmxnJJJmxLwojdLlRBb9NaQ7fsqNF8RrQf0R2z6YH6gaKtqYWwAOcGBT9OXZsUmu6Rxlhe1BiUSiBs20Iyord3i22MWHyL0/T26mOg7ptR5y93ZH2uzhMuAoj0v/aekIXLl7lHK/xpmSkuycbtB74OKtic7NzzEQqJ58kJ8jfMZdnXFyfA2sxkCV7clTdUrdtGFNZqNhPZtspQMwMsV/nl/F

On Wed, 2025-11-26 at 22:46 +0100, Andy Shevchenko wrote:
> For several years, and still ongoing, the kernel.h is being split
> to smaller and narrow headers to avoid "including everything" approach
> which is bad in many ways.

And I still think precompiled headers can be beneficial to
standardize using kernel.h to reduce overall compilation time.
