Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7B156236;
	Sat, 29 Nov 2025 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764431692; cv=none; b=V3sk20U+y8NjiDho7cfidil95qb8dvm0BXwRKvhVYxxfIbM8JvHoIHVodwcICIQTI5QKO+g1/n7JNlTwhchJdAnzGkGgVEs3KTbxUNywcVVNkDrsc8hduzkb2c/cEU+WrfTiYQTmouaCJDU+HrF24z/ac/UOvjUYK+emdga5yJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764431692; c=relaxed/simple;
	bh=ZZg1/Nb8xcaHhzeWTetxtTfInrWnsDsLwAeJ+Ur1Z6M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mdeKcPoZSmWh6fJ4jPijDpzLE1dtTGIAfm23Xf7afZo1KP+zHgUt3jdz9xvyYK9jHuwDwusjPmYmrR/ogxBB5cvD7EHXDbdl4N72n8SKNm7zxnOQA0TW1FfGqtRNpYDyuV+NnovH9USwS+eX6vaT+je1yK3XlcQomsOiOeR1/LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QZbz3fNa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QZbz3fNa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A9B2B406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764431689; bh=NN/lqfLcGsogwMSdNnadSHQCjtono1d3Hui3Ah8JgpQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QZbz3fNamR71uoESlAdfi628lhCRd9SqbaFFGBeyrMh6kAAOPeYeMXavGnpYc9iJg
	 l87qxKweCVUzKirGwsjfOjMud4UJTv7sSXmBPPKTcRvXbzEIwqVD8DKzJYR7kv55vS
	 RhI1ssh2+EgQZXKGkhJ7SYz+/eYY9GxZ7JZswWqvqyg9YS7ti1HoDEq61RzENl2Ldt
	 9y63oYRmucKDrjHV6NSQq/GumoHyWcSpQUxIMcGUexsv7uiHI3KGGLDoxOa+xdqsoM
	 dWTINetnFhdKMe7i+DT3nlViLa2LwiC1tdj8ZG7zk3YJXnHxWHjIgpZW7ZRnRjUaGF
	 z45nJGn2+BLNQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A9B2B406FB;
	Sat, 29 Nov 2025 15:54:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning
 of kernel.h
In-Reply-To: <aSsQFjv5DK_7GS6P@smile.fi.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <a731c794-1b4c-4ea7-9cf1-0210b95eaa4d@infradead.org>
 <aSsQFjv5DK_7GS6P@smile.fi.intel.com>
Date: Sat, 29 Nov 2025 08:54:48 -0700
Message-ID: <87wm38vnp3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Wed, Nov 26, 2025 at 04:26:04PM -0800, Randy Dunlap wrote:
>> On 11/26/25 1:46 PM, Andy Shevchenko wrote:
>> > For several years, and still ongoing, the kernel.h is being split
>> > to smaller and narrow headers to avoid "including everything" approach
>> > which is bad in many ways. Since that, documentation missed a few
>> > required updates to align with that work. Do it here.
>> > 
>> > Note, language translations are left untouched and if anybody willing
>> > to help, please provide path(es) based on the updated English variant.
>> > 
>> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> 
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks, Randy!
>
> Jonathan, please apply this change. Independently on the opinions about
> kernel.h the documentation has to be updated as it's currently misleading.

I will but not right away...I'm really trying to stabilize things,
already too late, for the merge window.

jon
