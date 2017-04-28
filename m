Return-Path: <joe@perches.com>
Message-ID: <1493416143.1873.13.camel@perches.com>
Subject: Re: [PATCH 0/3] dynamic_hex_dump cleanup
From: Joe Perches <joe@perches.com>
Date: Fri, 28 Apr 2017 14:49:03 -0700
In-Reply-To: <149341493336.35578.13631055553267152302.stgit@dwillia2-desk3.amr.corp.intel.com>
References: 
	<149341493336.35578.13631055553267152302.stgit@dwillia2-desk3.amr.corp.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-acpi@vger.kernel.org, Jason Baron <jbaron@akamai.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 2017-04-28 at 14:28 -0700, Dan Williams wrote:
> More than one driver has worked around the fact that
> print_hex_dump_debug() requires CONFIG_DYNAMIC_DEBUG=y to build.

No it doesn't.  builds work fine.  Output is restricted.

> Provide a dynamic_hex_dump() so that drivers that want the extra debugging to be
> turned off in the CONFIG_DYNAMIC_DEBUG=n can use dynamic_hex_dump()
> directly.

I think the concept is unnecessary
.
Just use print_hex_dump with KERN_DEBUG.
