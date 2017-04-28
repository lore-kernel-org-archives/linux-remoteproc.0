Return-Path: <joe@perches.com>
Message-ID: <1493420656.1873.22.camel@perches.com>
Subject: Re: [PATCH 0/3] dynamic_hex_dump cleanup
From: Joe Perches <joe@perches.com>
Date: Fri, 28 Apr 2017 16:04:16 -0700
In-Reply-To: <CAPcyv4hDC1f9xRJJyDK09ezF7Q=qz+fvku5qFP_FCrS2xh=zUA@mail.gmail.com>
References: 
	<149341493336.35578.13631055553267152302.stgit@dwillia2-desk3.amr.corp.intel.com>
	 <1493416143.1873.13.camel@perches.com>
	 <CAPcyv4iJvjJTd7M5_5saopTvKPStC=sYqq++FbE_qFJwpqmASw@mail.gmail.com>
	 <1493417230.1873.15.camel@perches.com>
	 <CAPcyv4h=DfkJu6+7by0HoVhUOKtoCJmc4GGg3XNxYURCkX09Tw@mail.gmail.com>
	 <CAPcyv4jzMfd8TrFcX0GR+6iz0SaJyO5NzzswrEVm-kNVfgrQFQ@mail.gmail.com>
	 <1493418714.1873.18.camel@perches.com>
	 <CAPcyv4hDC1f9xRJJyDK09ezF7Q=qz+fvku5qFP_FCrS2xh=zUA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux ACPI <linux-acpi@vger.kernel.org>, Jason Baron <jbaron@akamai.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 2017-04-28 at 15:59 -0700, Dan Williams wrote:
> ...but again, hex_dump_dbg() implies to me dev_dbg() behavior, i.e.
> that the hexdump happens in the KERN_DEBUG case

I think you are confusing KERN_DEBUG, a logging level, with a
preprocessor #define of DEBUG.

>  which I don't want. I
> want the call to be compiled out completely when it can't be
> enabled/disabled dynamically.

dev_dbg is compiled away completely when DEBUG is
not defined and when CONFIG_DYNAMIC_DEBUG is not
defined.

This hex_dump facility should behave the same way.

> I think we do need a hex_dump_dbg(), but that does not eliminate the
> utility of / need for dynamic_hex_dump().

dynamic_hex_dump should only exist when CONFIG_DYNAMIC_DEBUG
is enabled and should otherwise be invisible to driver code.
