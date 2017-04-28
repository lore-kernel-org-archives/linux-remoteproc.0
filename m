Return-Path: <dan.j.williams@intel.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h=DfkJu6+7by0HoVhUOKtoCJmc4GGg3XNxYURCkX09Tw@mail.gmail.com>
References: <149341493336.35578.13631055553267152302.stgit@dwillia2-desk3.amr.corp.intel.com>
 <1493416143.1873.13.camel@perches.com> <CAPcyv4iJvjJTd7M5_5saopTvKPStC=sYqq++FbE_qFJwpqmASw@mail.gmail.com>
 <1493417230.1873.15.camel@perches.com> <CAPcyv4h=DfkJu6+7by0HoVhUOKtoCJmc4GGg3XNxYURCkX09Tw@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Apr 2017 15:19:49 -0700
Message-ID: <CAPcyv4jzMfd8TrFcX0GR+6iz0SaJyO5NzzswrEVm-kNVfgrQFQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] dynamic_hex_dump cleanup
Content-Type: text/plain; charset=UTF-8
To: Joe Perches <joe@perches.com>
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux ACPI <linux-acpi@vger.kernel.org>, Jason Baron <jbaron@akamai.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Apr 28, 2017 at 3:14 PM, Dan Williams <dan.j.williams@intel.com> wrote:
> On Fri, Apr 28, 2017 at 3:07 PM, Joe Perches <joe@perches.com> wrote:
>> On Fri, 2017-04-28 at 14:52 -0700, Dan Williams wrote:
>>> On Fri, Apr 28, 2017 at 2:49 PM, Joe Perches <joe@perches.com> wrote:
>>> > On Fri, 2017-04-28 at 14:28 -0700, Dan Williams wrote:
>>> > > More than one driver has worked around the fact that
>>> > > print_hex_dump_debug() requires CONFIG_DYNAMIC_DEBUG=y to build.
>>> >
>>> > No it doesn't.  builds work fine.  Output is restricted.
>>> >
>>> > > Provide a dynamic_hex_dump() so that drivers that want the extra debugging to be
>>> > > turned off in the CONFIG_DYNAMIC_DEBUG=n can use dynamic_hex_dump()
>>> > > directly.
>>> >
>>> > I think the concept is unnecessary
>>> > .
>>> > Just use print_hex_dump with KERN_DEBUG.
>>>
>>> No, we don't want any possibility of output in the
>>> CONFIG_DYNAMIC_DEBUG=n case. This is extra debug that only makes sense
>>> in the CONFIG_DYNAMIC_DEBUG case.
>>
>> No, that doesn't work the same.
>>
>> Look at your conversion of drivers/acpi/nfit/core.c
>>
>> dev_dbg outputs always when DEBUG is defined and
>> optionally outputs when CONFIG_DYNAMIC_DEBUG is enabled.
>
> Right, that's what I want dev_dbg() to output at KERN_DEBUG level
> always and the hexdump only in the dynamic case.

Joe, I'm trying to understand your objection. What you are proposing
is that the debug output is present at the KERN_DEBUG level in the
CONFIG_DYNAMIC_DEBUG=n case and that's not what either use case wants.
What breaks by letting users call dynamic_hex_dump() directly?
